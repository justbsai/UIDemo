require 'selenium-webdriver'
require 'json'

class Form_Page 
  
  class << self

    def load_properties()
      @json = File.read('properties.json')
      @obj = JSON.parse(@json)
    end
    
    #Get Page Title
    def page_title(driver)
      return driver.title
    end
    
    #Name Element
    def user_name(driver)
      return get_element(driver,'name.textbox')
    end
    
    #Name Error
    def name_error(driver)
      return driver.find_element(:xpath,"//*[@id='ss - form']/ol/div[1]/div/div/div[2]").text;
    end
    
    #Development Checkbox
    def check_development(driver,option)
      if option=='Yes' 
        return get_element(driver,'development_yes.checkbox')
      elseif option=='No'
        return get_element(driver,'development_no.checkbox')
      end
    end
    
    #Development Error
    def development_error(driver)
      return driver.find_element(:xpath,"//form[@id='ss-form']/ol/div[2]/div/div/div[2]").text;
    end
    
    #Favorite Framework
    def select_fav_framework(driver,choice)
      Selenium::WebDriver::Support::Select.new(get_element(driver,'fav_framework.select')).select_by(:value, choice)
    end
    
    #User Comments
    def user_comments(driver)
      return get_element(driver,'comments.textbox')
    end
    
    #Submit Button
    def submit_button(driver)
      return get_element(driver,'submit.button')
    end
    
    #Closing the browser
    def close_browser(driver)
      driver.quit
    end
    
    #Get the locator type and value from properties.json file
    private
    def get_element(driver,element)
      json_element=@obj['Form_Page'][element].split(':')
      if json_element[0]=='id'
        return driver.find_element(:id,json_element[1])
      elseif json_element[0]=='xpath'
        return driver.find_element(:xpath,json_element[1])
      elseif json_element[0]=='name'
        return driver.find_element(:name,json_element[1])
      elseif json_element[0]=='tag_name'
        return driver.find_element(:tag_name,json_element[1])
      elseif json_element[0]=='css'
       return driver.find_element(:css,json_element[1])
      end
    end
  end
end