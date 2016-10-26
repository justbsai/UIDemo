# UIDemo
##Exercise
This exercise is meant to give us a basic idea of your coding aptitude and style. It should also give you a chance to try out Ruby, and see if it's for you. Once you have Ruby set up, the exercise should take about 30 - 90 minutes to complete. Given the following web page, basic web form, write a Ruby script that demonstrates one positive, and one negative test case. Please use the following criteria:
- Code should be written in Ruby (any version >= 1.93)
- Use Selenium WebDriver (any browser)
- Use Test Unit to create the test cases
- Briefly describe the two test cases in words
- Create a new public git repository, and push your code to a branch named 'GUI'

##Automation Framework Design Considerations
- Designed the framework to support maximum code reusability.
- Implemented Page Object Model for enhancing test maintenance and reducing code duplication. (Files: Form_Page.rb, Success_Page.rb)
- Maintained a seperate object respository/properties (properties.json) file to maintain webelement locater types and values and used JSON class to load the locators.
- Used the logger class for logging each step for easy error resolution (Tests_Log.log)

##Upgrades
- Currently test data is hardocoded into the code. Instead we can use a CSV or Excel file to store test data and develop utility classes to inject the data into the code.
- Exception handling can be extended to resolve unexpected errors that might occur.

##Tests
###Test Case 1 - Positive Test Case
- In this testcase we are testing the webpage by entering valid data into the fields and selecting all the mandatory fields.

Step 1 - Open Chrome and Navigate to the given webpage.

Step 2 - Assert if the title of the loaded page with the expected title.

Step 3 - Enter data into the Name Text Box.

Step 4 - Select any check box for the field "Do you enjoy development?".

Step 5 - Select any option from the "Favourite Test Framework" dropdown.

Step 6 - Enter Text into Comments Field

Step 7 - Click on Submit Button

Step 8 - Assert the success page title with the expected title.

Step 9 - Assert the success message with the expected message.

Step 10 - Exit the browser

###Test Case 2 - Negative Test Case
- In this testcase we are testing the error if no option is selected for "Do you like development?" field

Step 1 - Open Chrome and Navigate to the given webpage.

Step 2 - Assert if the title of the loaded page with the expected title.

Step 3 - Enter data into the Name Text Box.

Step 4 - Click on Submit button

Step 5 - Verify if the control is in the same page and check if "This is a required question" error is displayed.

Step 6 - Exit the browser

##Other Tests
- Test for Invalid data in fields i.e. entering all spaces/numbers/special characters or anything except for A-Za-z
- Test what happens if we are exceedng the limit of characters in TextBoxes.
- Securing the webpage to prevent SQL injection attacks and Cross Site scripting etc.
