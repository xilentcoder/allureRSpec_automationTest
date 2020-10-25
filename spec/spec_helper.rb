# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'allure-rspec'
require 'uuid'

AllureRspec.configure do |c|
  c.results_directory = 'report/allure-results'
  c.clean_results_directory = true
  #c.link_tms_pattern = 'https://example.org/tms/{}'
  #c.link_issue_pattern = 'https://example.org/issue/{}'
end

RSpec.configure do |config|

#.before(all) means to run the code inside it before running all test cases.
 config.before(:all) do
    @driver = Selenium::WebDriver.for :chrome
	@driver.get('https://cloudvr.pythonanywhere.com/bank/login')
  end

   # config.after(:example) do |example|
    # if example.exception
      # example.attach_file('screenshot', File.new(
        # @driver.save_screenshot(
          # File.join(Dir.pwd, "report/allure-results/#{UUID.new.generate}.png"))))
    # end

   	# end
  
  # config.after(:example) do
    # Allure.step(name: 'After hook step')
    # Allure.add_attachment(
      # name: 'After hook attach',
      # source: "report/#{UUID.new.generate}.png",
      # type: Allure::ContentType::PNG,
      # test_case: true
    # )
  # end
  
  
  #.after(:example) means to run the code inside it after each test case.
   config.after(:example) do |example|
   if example.exception
    example.add_attachment(
      name: 'screenshot',
      source: File.new(
        @driver.save_screenshot(
          File.join(Dir.pwd, "report/allure-results/#{UUID.new.generate}.png"))),
      type: Allure::ContentType::PNG,
      test_case: true
    )
	end
  end
  
  
 	
	 config.after(:all) do
       @driver.quit
	 end
	
  
end
