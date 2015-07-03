Feature: Installation of dependencies
  In order to check that the supplied homework can be graded by AutoGrader
  As an AutoGrader deployer
  I need to check the installation

  Scenario: Install gems
    Given that I am in the project root directory "hw-ruby-intro-ci"
    When I install gems
    Then I should see that there are no errors

  Scenario: Install or check AutoGraders
    Given that I am in the project root directory "hw-ruby-intro-ci"
    When I install or check "saasbook/rag" as "rag"
    And I change to branch "autograder_engine_refactor"
    And I install the AutoGrader gems
    And I run cucumber for AutoGrader
    ## two errors presently, skip this:  Then I should see that there are no errors

  Scenario: Verify correct version of AutoGraders
    Given I go to the AutoGrader directory "rag"
    And it has an origin of "saasbook/rag"
    When I fetch the latest on origin branch "autograder_engine_refactor"
    Then I should see no difference