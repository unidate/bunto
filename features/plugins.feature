Feature: Configuring and using plugins
  As a hacker
  I want to specify my own plugins that can modify Bunto's behaviour

  Scenario: Add a gem-based plugin
    Given I have an "index.html" file that contains "Whatever"
    And I have a configuration file with "gems" set to "[bunto_test_plugin]"
    When I run bunto build
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Whatever" in "_site/index.html"
    And I should see "this is a test" in "_site/test.txt"

  Scenario: Add an empty whitelist to restrict all gems
    Given I have an "index.html" file that contains "Whatever"
    And I have a configuration file with:
      | key       | value                |
      | gems      | [bunto_test_plugin] |
      | whitelist | []                   |
    When I run bunto build --safe
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Whatever" in "_site/index.html"
    And the "_site/test.txt" file should not exist

  Scenario: Add a whitelist to restrict some gems but allow others
    Given I have an "index.html" file that contains "Whatever"
    And I have a configuration file with:
      | key       | value                                              |
      | gems      | [bunto_test_plugin, bunto_test_plugin_malicious] |
      | whitelist | [bunto_test_plugin]                               |
    When I run bunto build --safe
    Then I should get a zero exit status
    And the _site directory should exist
    And I should see "Whatever" in "_site/index.html"
    And the "_site/test.txt" file should exist
    And I should see "this is a test" in "_site/test.txt"