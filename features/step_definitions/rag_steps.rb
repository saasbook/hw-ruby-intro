require 'open3'

# Configure path from homework to rag folder, or can be absolute
HW_RAG_PATH = 'rag'
# path from rag to the homework folder, or use absolute path if HW_RAG_PATH is a link
require 'debugger'

RAG_HW_PATH = '..'

Given(/^I clone "(.*?)" branch of public skeleton "(.*?)" into "(.*?)"$/) do |branch, skel_repo, dir|
  run_process("rm -rf #{skel_repo.split('/')[1]}", ".")
  run_process("mkdir -p #{dir}", ".")
  run_process("git clone -b #{branch} https://github.com/#{skel_repo}", dir)
  cloned = dir+ '/' + skel_repo.split('/')[1]
  expect(Dir).to exist(cloned)
end

Given /I have the homework in "([^"]*)"/ do |path|
  @hw_path = path
end

When(/^I run AutoGrader for (.*) and (.*)$/) do |test_subject, spec|
  run_ag("#{@hw_path}/#{test_subject}", "#{@hw_path}/#{spec}")
end

Then(/^I should see that the results are (.*)$/) do |expected_result|
  expect(@test_output).to match /#{expected_result}/
end

Then /^I should see the execution results with (.*)$/ do |test_title|
  success = @test_status.success? ? 'Success' : 'Failure'
  puts success + '!'
end


def run_ag(subject, spec, strategy = 'Rspec grader')
  debugger
  run_process "./grade #{RAG_HW_PATH}/#{subject} #{RAG_HW_PATH}/#{spec}"
end

def run_process(cli_string, dir=HW_RAG_PATH)
  @test_output, @test_errors, @test_status = Open3.capture3(
      {'BUNDLE_GEMFILE' => 'Gemfile'}, cli_string, :chdir => dir
  )
  puts (cli_string +
      @test_output +
      @test_errors +
      @test_status.to_s) unless @test_status.success? #and @test_errors.empty?
end