Feature: New subscription plan changes 
	In order to use Agentcis
	As a Trial user

	I need to be able to use the system at first on 14 days trial
	I need to be able to upgrade my subscription from trial to paid subscription

Scenario: Entering Agentcis Registration
	Given I am in "Agentcis Pricing Page"
	And I have a field to click "Start your free trial"
	When I click "Start your free trial"
	Then I will be redirected to "Agentcis Register page"
    And I will be registaring on a 1 user "Monthly plan"

Scenario: Completing Registration
	Feature: Filling up Business Details for registration

	Background I am in "Agentcis Registration Page"

	Given I have fields to insert "Personal Details"
	//"First name, Last name, Email, Confirm Email, Password, Confirm Password and Subdomain"//
	And I see all Business details fields mandatory marked with "*"
	And I also see a button at the bottom to go to next stage "Continue"
    And I will also view "Monthly per user pricing" details on the right of the page
	When I fill up all the fields in "Personal Details"
	And I click "Continue"
	Then I am redirected to "Payment Details page"


	Feature: Filling up Card Details for registration
	Given I have fields to "Enter Payment Details"
	//Preferred Currency, Card Holder Name, Card Nuumber, Expiry date, Cvv number//
	And I have fields to "Enter Billing Address"
	//Business name, Street Address, City/Suburb, state, Zip/Post code, Country//
	And I see all fields mandatory marked with "*" 
	And I also see a button at the bottom left to go to Previous stage with label "Back", in case of any mistakes
	And I also see a button at the bottom right to go to next stage with label "Continue"
    And I will also view "Monthly per user pricing" details on the right of the page
	When I fill up all the fields of "Payment Details and Billing Address"
	And I click "Continue"
	Then I am redirected to "Confirmation Page"


	Feature: Confirming details for registration
	Given I have section to view previously filled "Business details and Payment details"
	And I also have a checkbox option to accept "Terms and conditions" which is mandatory
	And I also see a pre selected checkbox to"Subscribe Newsletter"
	And I also see a button in case of any mistake at the bottom left to go to Previous stage "Back" 
	And I see at the bottom "Submit button"
	When I double check all "Personal Details, Payment details and Billing Address"
    And I can check/uncheck the "Subscribe Newsletter" as per user wish
	And I check the "Terms and conditions"
	And I click "Submit"
	Then I see a loading page showing "we are setting up your Agentcis system"
    And If I check the "Subscribe Newsletter" then I am subscribed to receive Newsletter
	And I also get an "Confirmation email"
	And I am redirected to the Agentcis onboarding page according to the subdomain entered in the "Business detail page"



Scenario: Checking out system in Trial and Trial end date
	Background I am using Agentcis with own "Subdomain"
	And I can use system with credential which i have inserted in "Email & password field of Business detail page"
	Given I am using own subdomain to redirect to "Login page"
	And I have fields to enter "Email and password"
	And I can also see "Login Button"
	When I enter email in "Email field"
	And I enter password in "Password field"
	And I can also after entering credentials click on "Login Button"
	Then I am redirected to "Choose User Page"
    And I see "Pricing details" and Billing date according to the user I choose on the "Choose User Page"
    And I click "Proceed"
    And I get another form showing option to select "Populate Sample Data"
    And I enable "Populate Sample Data" option
	And I land on the "Dashboard"
	And I see Trial end date on below Top Navigation on "Dashboard"
	And I click on settings cog wheel it expands and show all "Settings list"
	And I click on "Admin Settings"
	And I click on "Subscription and Usage tab"
	And I see Trial end date, Users Limit and Storage Limit on "subscription and Usage page"

Scenario: Checking and changing user limits on Trial
	Given I am using Agentcis with Owner credentials
	And I have access to add all other 6 users
	//Admin, Operator, Manager, Accountant, counselor and subagent//
    And I didn't addup Users limit from "Choose User Page" after first login
	When I click on Teams > Users menu
	And I see myself as only one user in the list 
	And I click on Invite user button
	And I get error message showing "Oops, looks like you reach your user limit"
    And If I am user with roles otherthan owner then i get message showing "Oops, looks like you reach your user limit.Please contact your account owner."
	And I click on Add Users button
	Then I am redirect to subscription "Choose plan page"
	And I enter the "Number of user" I wish to have
	And I select "Monthly or Yearly plan"
	And I enter "coupon code" for discount
	And I see Total amount, Discount amount and adjustment amount 
	And I choose storage "Add on" as per my need
 	And I see "Net price = Total Amount + Add on - (Discount + Adjustment amount)"
	And I click next 
	And I am redircted to next "Payment Details Page"
	And I Select or add up New card click change plan
    //Maximum of 3 cards can be inserted//
	And I see a success message "You have successfully updated your subscription plan"
    And I am redirected to "Dashboard"
	And I click on settings cog wheel it expands and show all "Settings list"
	And I click on "Admin Settings"
	And I click on "Subscription and Usage tab"
	And I see Trial end date, Users Limit and Storage Limit on "subscription and Usage page"

Feature: Using system as a Paid User after Trial
Scenario: I am Using Agentcis 14 days Trial
	Background I am using Agentcis with own "Subdomain"
    Given I am using system in "14 days Trial"
    When Agentcis trail period ends i.e. On the 15th day Agentcis will try to "charge from the card"
    And on the basis of the Number of users, Add-On and coupon code is inserted
    And Payment is unsuccessful system will try to charge "3 times on every 2 days interval"
    When System cannot charge after 6 days grace period
    Then "system deactivates automatically"
    When Payment is successful I use the system as "Paid user"
    And I get an email of the "Invoice" with details
    And I can see Next Billing date 
    And Next Billing amount changes accordingly in "subscription and Usage page"


Feature: Cancelling subscription
Scenario: I want to cancel subscription in Trial
Given I am using system in "14 days Trial"
    When I goto "subscription and Usage page"
    And I see and click on "Cancel Subscription" button at the bottom
	Then I am redirected to first page of cancellation showing "Are you sure you want to cancel your subscription?"
	And I see two buttons "Go to Dashboard" & "Continue Cancellation" at the bottom
	And I can also see "Emoji animations" chaning while hovering to the buttons
	When I click "Go to Dashboard" I am redirected to "Dashboard" but if I click "Continue canellation"
	Then I am redirected to second page of cancellation Where I need to enter "comment for leaving"



    And Payment is unsuccessful system will try to charge "3 times on every 2 days interval"
    When System cannot charge after 6 days grace period
    Then "system deactivates automatically"
    When Payment is successful I use the system as "Paid user"
    And I get an email of the "Invoice" with details
    And I can see Next Billing date 
    And Next Billing amount changes accordingly in "subscription and Usage page"


Scenario: I want to cancel subscription after payment


Feature: Reactivating subsription









