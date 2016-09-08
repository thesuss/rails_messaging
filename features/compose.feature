Feature: As a user
 in order to send messages
 I need to be able to compose messages (recipient, subject, msg)

 Background:
   Given following users exist
     | name   | email              | password |
     | Jenny  | jenny@random.com   | password |
     | Anna   |  anna@random.com   | password |


 Scenario: Compose-button on mailbox page
   Given I am logged in as "Jenny"
   And I am on the "mailbox" page
   Then I should see "Compose"
   When I click the "Compose" link
   Then I should be on the "compose" page

 Scenario: Sending a message
   Given I am logged in as "Jenny"
   And I am on the "compose" page
   When I select "Anna" in "Recipients"
   And I fill in "Subject" with "here's a message"
   And I fill in "Message" with "message body"
   When I click the "Send Message" button
  #  Then I should be on the "conversation" page
   And I should see "Your message was successfully sent"
   And I should see "here's a message"


 Scenario: I send a message
   Given I am logged in as "Jenny"
   And I send a mail to "Anna" with subject "Hey there Anna!"
   And I am on the "mailbox" page
   When I click the "Sent" link
   Then I should see "Hey there Anna!"