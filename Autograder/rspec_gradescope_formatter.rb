require 'rspec/core/formatters/base_text_formatter'
require 'json'

# @see https://gradescope-autograders.readthedocs.io/en/latest/specs/

class RSpecGradescopeFormatter < RSpec::Core::Formatters::BaseTextFormatter

  RSpec::Core::Formatters.register(self,
    :example_started,           # collect points from example name
    :example_passed,            # when example passes, record points earned
    :example_failed,            # when example fails, capture error message
    :example_pending,           # when example pending... (TBD)
    :close)                     # when run is over, emit JSON
  # other hooks we don't use: example_group_started, example_group_finished, example_section_finished

  def initialize(output)
    @output = output
    @total_points = 0
    @passed_points = 0
    @current_test_case = nil # when an example starts, this gets set to a hash that will capture example's results
    @results = {
      # optional fields:
      # "score" => 0.0, # total; required if not on each test case below. Overrides total if specified.
      # "execution_time" => 0, #  seconds
      # "output" => "Text relevant to the entire submission", 
      # "visibility" => "after_due_date", # visibility setting
      # "stdout_visibility" => "visible", # stdout visibility setting, if tests write things on stdout
      # "extra_data" => {},     # Optional extra data to be stored
      "tests" => [ ]    # Optional, but required if no top-level score
    }
  end

  # @see https://www.rubydoc.info/gems/rspec-core/RSpec/Core/Notifications
  # @see https://www.rubydoc.info/gems/rspec-core/RSpec/Core/Example
  def example_started(notification)
    example = notification.example # an instance of RSpec::Core::Example
    points = extract_points(example)
    if points > 0
      @current_test_case = {
        'max_score' => points,
        'name' => example.full_description,
        # "number" =>  "1.1", # optional (will just be numbered in order of array if no number given)
        # "output" =>  "Giant multiline string that will be placed in a <pre> tag and collapsed by default", # optional
        # "tags" =>  ["tag1", "tag2", "tag3"], # optional
        # "visibility" =>  "visible", # Optional visibility setting
        # "extra_data" =>  {} # Optional extra data to be stored
        'output' => ''
      }
    else
      @current_test_case = nil # this prevents other methods from trying to fill in
    end
  end

  def example_passed(notification)
    if @current_test_case
      @current_test_case['score'] = @current_test_case['max_score']
      @results['tests'] << @current_test_case
    end
  end
  
  def example_failed(notification)
    if @current_test_case
      fail_exception = notification.example.exception # the reason the test failed
      @current_test_case['output'] = fail_exception.message
      @current_test_case['score'] = 0
      @results['tests'] << @current_test_case
    end
  end

  def example_pending(notification)
    # make sure we DON'T even try to count this test case
    @current_test_case = nil
  end
  
  def close(notification)
    # write all output to results.json
    # choose between pretty vs. uglified/compacted JSON here:
    output = JSON.pretty_generate(@results)
    # output = @results.to_json
    File.open("results/results.json", "w") do |f|
      f.puts output
    end
  end
  
  private
  def extract_points(example)
    # if an example's metadata has :points => N, extract that.
    # elsif its description includes "[N points]", extract that.
    # if it has both and they match, issue a warning
    # if it has both and they don't match, issue an error
    points_from_metadata = example.metadata.has_key?(:points) ? example.metadata[:points].to_i : nil
    points_from_description = example.description =~ /\[\s*(\d+)\s*points?\s*\]\s*$/ ? $1.to_i : nil
    if points_from_metadata && points_from_description
      # if they are equal, warning for example.metadata[:location] (file path + line num)
      if points_from_metadata == points_from_description
        puts "#{example.metadata[:location]}: points given in both metadata and example docstring"
      else
        raise RuntimeError.new("#{example.metadata[:location]}: points given in both metadata and example docstring, and they don't match")
      end
      points_from_metadata
    else
      points_from_metadata || points_from_description || 0
    end
  end
end

