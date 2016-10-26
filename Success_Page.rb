#Page Object Class for Success_Page containing methods for all elements in the page.

require 'selenium-webdriver'

class Success_Page
  class << self
    #Get Page Title
    def page_title(driver)
      return driver.title
    end

    #Get Success Message
    def success_message(driver)
      return driver.find_element(:xpath,"//div[@class='ss-resp-message']").text
    end
  end
end