Feature: client check in system
  
	In order to  keep logs of time intervals spent on every visit of each and every clients 
	And time intervals of every employees to attend a client

	As a employee of the office
	I need to view all the logs of the clients I attended with the time duration of every visit

	And As a Head of the office
	I need to view all the visit and time logs of clients attended by all employees

	Scenario: Checking out the permissions
		Given I am logged in as "Owner" I am in "Active Users" page
		And I have "List of Active Users"
		And I select an Active User from the list for eg"Donald Trump with role Manager"
		And I am redirected to the User detail page 
		And I see permission tab
		When I click on Permission tab
		And I expand Check in section on the permission tab
		And I enable permissions
			-View logs of all clients attended by other users
			// can view logs of all clients accessible to me which are attended by other 				users as well.//

			-View logs of only attended by me clients
			// can view logs of all clients accessible to me which are attended by myself.//

			-Add check in detail
			// can only add new check in detail.//

			-Edit check in detail
			// can only edit the check in detail.//	
		
			-Archive and Delete check in detail
			//can archive and delete the logs.//

		Then I login as the above mentioned & edited Active user "for eg Donald Trump with role Manager"
		And  I can see "Check-in Icon" on Top nav, "Check-in menu" in Side nav, "Check-in Widget" in Dashboard and "Office vist logs" in Contacts detail page.
		


	Scenario: New client visit
		Given I will share the Lead form page to the Client
        	And I can see the client in my enquiry page
		And I have "CheckIn Icon" on the top right corner
		When I click on the CheckIn icon 
		Then I reach to a pop up
		When I select the office, clients, status & assignee
			// view access of all the clients and office in drop down.
		And I insert the Purpose of the visit in comment box 
			//Character limit to 300
        	And I save

	Scenario: Existing client visit
        	Given I am logged in as "Owner" I am in "Dashboard" page
        	And I have "CheckIn Icon" on the top right corner
		When I click on the CheckIn icon 
		And I reach to a pop up
        	When I search for client 
        	And I select Client
		And I select the office, status & assignee
		And I insert the Purpose of the visit in comment box 
        	And I save

	Scenario: Attending client
        Given I am logged in as a counseller 
	And I can see the list of client assigned to me in que in Dashboard widget
        When I click on Client 
        Then I Can see a pop up.
        When I add comment
		//Addding comment is not mandatory
        And I click on attend
        Then I can see client status in now attending 
	Given I am in Office check-in system menu
	And I can see the list of client assigned to me
	When I click on Client 
        Then I Can see a pop up.
        When I add comment
        And I click on attend
        And client status in now attending 


	Scenario: Archiving and Deleting Client Visit detail
        Given I am logged in as "Owner" 
	And I am on Office check-in system menu
        When I select the client in the Visit list
        And I can see the popup with the client visit detail.
        When i click on the archive
        Then the client visit detail will be archived
        When i click on the delete
        Then the client visit detail will be deleted.

	Scenario: Checking Dashboard widget
        Given I am logged in as "Counseller"
        And I am on Dashboard page
        And I am assigned to Client
        And I can see the client.
        When client is not assigned to anyone
        Then I can also see all unassigned client of my office 

	Scenario: checking logs in clients detail
        Given I am logged as owner
        And I am on client detail page 
        And I can see Office Visits tab
        When i click on Office visit tab.
        Then i can see all the previous activities of that particular client during client visit

	Scenario: Checking logs in check-in logs page
        Given I am logged as owner
        And I am on Office check-in system menu (side nav)
        When i click on Waiting
        Then i can see all the waiting clients
        When i click on Completed
        Then i can see all the Completed clients
        When i click on Attending
        Then i can see all the clients who are being attended
        When i click on All
        Then i can see all the clients who have visited the office