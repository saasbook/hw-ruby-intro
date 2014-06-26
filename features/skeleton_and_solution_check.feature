Feature: Testing RUBY_INTRO homework
  In order to check that the supplied homework can be graded by AutoGrader
  As a AutoGrader maintainer
  I would like these homeworks to be automatically tested on submit

  Scenario Outline: Runs AutoGrader with a given spec sheet
    Given I clone "master" branch of public skeleton "saasbook/ruby-intro" into "."
    And I have the homework in "."
    When I run AutoGrader for <test_subject> and <spec>
    Then I should see that the results are <expected_result>
    And I should see the execution results with <test_title>
  Examples:
    | test_title               | test_subject           | spec                     | expected_result       |
    | Part1: specs vs solution | solutions/lib/part1.rb | ruby-intro/spec/part1_spec.rb | Score out of 100: 100 |
    | Part1: specs vs skeleton | ruby-intro/lib/part1.rb    | ruby-intro/spec/part1_spec.rb | Score out of 100: 10  |
    | Part2: specs vs solution | solutions/lib/part2.rb | ruby-intro/spec/part2_spec.rb | Score out of 100: 100 |
    | Part2: specs vs skeleton | ruby-intro/lib/part2.rb    | ruby-intro/spec/part2_spec.rb | Score out of 100: 30  |
    | Part3: specs vs solution | solutions/lib/part3.rb | ruby-intro/spec/part3_spec.rb | Score out of 100: 100 |
    | Part3: specs vs skeleton | ruby-intro/lib/part3.rb    | ruby-intro/spec/part3_spec.rb | Score out of 100: 30  |
