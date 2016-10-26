require 'logger'
require 'test/unit'
require 'selenium-webdriver'

require_relative 'Form_Page.rb'
require_relative 'Success_Page.rb'

class Tests < Test::Unit::TestCase
  #Initital Setup of Selenium Driver
  def setup
    $logger = Logger.new('Tests_Log.log')
    Selenium::WebDriver::Chrome.driver_path ="/chromedriver.exe"
    $driver=Selenium::WebDriver.for :chrome
    $logger.info('Driver Setup Done')
    $driver.get 'https://docs.google.com/forms/d/e/1FAIpQLSeT6MPuoZm8Ks3TUw9j3lTKeUlwvcVseFeear6OF4ey24Q40g/viewform'
    $logger.info("Web page loaded")
  end

  def teardown
    $driver.quit
  end

  #Script to test the positive flow of the webpage. Entering valid data into the form.
  def test_poistive
    begin
      #Loading the properties (Object Repository) of Form_Page
      Form_Page.load_properties()
      $logger.info('Form_Page properties loaded')

      #Asserting if Title is same
      assert_equal('Basic Web Forms',Form_Page.page_title($driver))
      $logger.info('Asserted Title')

      #Entering text inside name text box
      Form_Page.user_name($driver).send_keys 'James'
      $logger.info('Entered Name into Name Textbox')

      #Checking Development Option
      Form_Page.check_development($driver,'Yes').click
      $logger.info('Development checkbox ticked')

      #Selecting favourite framework
      Form_Page.select_fav_framework($driver,'testNG')
      $logger.info('Favourite Framework Selected')

      #Entering comments
      Form_Page.user_comments($driver).send_keys 'I like automation testing'
      $logger.info('Comments Entered')

      #Submitting the form
      Form_Page.submit_button($driver).click
      $logger.info('Submit Button Clicked')

      #Asserting the title of Success_Page
      assert_equal('Thanks!',Success_Page.page_title($driver))
      $logger.info('Asserted Success page Title')
      assert_equal("Your response has been recorded.",Success_Page.success_message($driver))

      #Just for evaluation purpose
      sleep 5
    rescue Exception => e
      $logger.error(e.backtrace)
      puts e
      puts e.backtrace

    end
  end

  #Negative testing of the webpage. Not selecting any development option and checking for error.
  def test_negative
    begin
      #Loading the properties (Object Repository) of Form_Page
      Form_Page.load_properties()
      $logger.info('Form_Page properties loaded')

      #Asserting if Title is same
      assert_equal('Basic Web Forms',Form_Page.page_title($driver))
      $logger.info('Asserted Title')

      #Entering text inside name text box
      Form_Page.user_name($driver).send_keys 'Karen'
      $logger.info('Entered Name into Name Textbox')

      #Submitting form without electing development option
      Form_Page.submit_button($driver).click
      $logger.info('Submit Button Clicked')

      #Asserting Development CheckBox Error
      assert_equal("This is a required question", Form_Page.development_error($driver))
      $logger.info("Asserted Development Checkbox error")

      #Just for evaluation purpose
      sleep 5

    rescue Exception => e
      $logger.error(e.backtrace.join('\n'))
      print e
      print e.backtrace
    end
  end
end