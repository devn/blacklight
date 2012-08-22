# @bookmarks
# Feature: Bookmarks
#   In order to collect documents
#   As a user
#   I want to bookmark documents



#   Scenario: Bookmarks While Not Logged In
#     When I go to the bookmarks page
#     Then I should see "You have no bookmarks"

#   Scenario: Bookmarks Menu Link
#     Given I am logged in as "user1"
#     When I am on the home page
#     Then I should see "Your Bookmarks"
#     When I follow "Your Bookmarks"
#     Then I should be on the bookmarks page
#     And I should see a stylesheet
  
#   Scenario: No Bookmarks
#     Given I am logged in as "user1"
#     When I go to the bookmarks page
#     Then I should see "You have no bookmarks"
    
#   Scenario: Bookmarks not logged in
#     When I go to the bookmarks page
#     Then I should see "Sign in"

#   Scenario: User Has Bookmarks
#     Given I am logged in as "user1"
#     And "user1" has bookmarked an item with title "foo bar"
#     When I go to the bookmarks page
#     Then I should see "Your Bookmarks"
#     And I should see "foo bar"

#   Scenario: Deleting a Bookmark
#     Given I am logged in as "user1"
#     And "user1" has bookmarked an item with title "foo bar"
#     And I am on the bookmarks page
#     Then I should see a "Remove" button
#     When I press "Remove"
#     Then I should see "Successfully removed bookmark."

#   Scenario: Clearing Bookmarks
#     Given I am logged in as "user1"
#     And "user1" has bookmarked an item with title "foo bar"
#     And "user1" has bookmarked an item with title "boo baz"
#     And I am on the bookmarks page
#     Then I should see "Clear Bookmarks"
#     When I follow "Clear Bookmarks"
#     Then I should see "Cleared your bookmarks."
#     And I should see "You have no bookmarks"
    
#   Scenario: Adding and removing a bookmark from search results
#     Given I am logged in as "user1"
#     When I am on the home page
#     And I fill in "q" with "book"
#     And I press "search"
#     When I press "Bookmark"
#     Then I should see "Successfully added bookmark."
#     # We should be back on search results here, but due to
#     # what I believe is a bug in Cucumber with query strings
#     # and http Referer, we're not, we're on home page, so we'll
#     # navigate back, sorry. 
#     And I fill in "q" with "book"
#     And I press "search"
#     Then I press "Remove bookmark"
#     And I should see "Successfully removed bookmark."
    
#   Scenario: Adding and deleting bookmark from show page
#     Given I am logged in as "user1"
#     When I am on the document page for id 2007020969
#     Then I should see a "Bookmark" button
#     And I press "Bookmark"
#     #Then I should see "Successfully added bookmark"
#     And I should see a "Remove bookmark" button
#     And I press "Remove bookmark"
#     And I should see "Successfully removed bookmark"
    
# Feature: User Bookmarks
#   In order to keep track of items
#   As a user
#   I want to be able to store items in my Bookmarks

#   Scenario: Ensure "Add to Bookmarks" form is present in search results
#     Given I am on the home page
#     When I fill in "q" with "history"
#     And I select "All Fields" from "search_field"
#     And I press "search" 
#     Then I should see an add to bookmarks form
      
#   Scenario: Ensure "Add to Bookmark" for is present on individual record
#     Given I am on the document page for id 2007020969
#     Then I should see an add to bookmarks form
    
#   Scenario: Adding an item to the folder should produce a status message
#     Given I am on the home page
#     And I follow "English"
#     And I add record 2008308175 to my folder
#     Then I should see "Selected Items (1)"

#   Scenario: Do not show "Add to Favorites" when not logged in
#     Given I have record 2007020969 in my folder
#     When I follow "Selected Items"
#     Then I should not see "Add to Folder"
    
#   Scenario: Show "Add to Favorites" when logged in and viewing folder
#     Given I am logged in as "user1"
#     And I have record 2007020969 in my folder
#     When I follow "Selected Items"
#     Then I should see "Add to Bookmarks"
        
#   Scenario: Do multiple citations when the folder has multiple items
#     Given I have record 2007020969 in my folder
#     And I have record 2008308175 in my folder
#     When I follow "Selected Items"
#     And I follow "Cite"
#     Then I should see "Pluvial Nectar of Blessings : a Supplication to the Noble Lama Mahaguru Padmasambhava. Dharamsala: Library of Tibetan Works and Archives, 2002."
#     And I should see "a Native American elder has her say : an oral history. 1st Atria Books hardcover ed. New York: Atria Books."
    
#   Scenario: Make sure the folder page doesn't bomb if there is no search session
#     Given I am on the folder page
#     # That's all that is needed -- it will fail to render if it's not right
    
#   Scenario: Don't show the tools if there are no items in the folder
#     Given I am on the folder page
#     Then I should not see the Folder tools

#   Scenario: Show the tools if there are items in the folder
#     Given I have record 2008308175 in my folder
#     And I follow "Selected Items"
#     Then I should see the Folder tools
    
#   Scenario: Controls on the record view
#     When I am on the document page for id 2008308175
#     Then I should see an add to folder form
#     Given I have record 2008308175 in my folder
#     When I am on the document page for id 2008308175
#     Then I should see a remove from folder form
    
#   Scenario: Controls on the folder view
#     Given I have record 2008308175 in my folder
#     When I am on the folder page
#     Then I should see a remove from folder form
#     When I remove record 2008308175 from my folder
#     Then I should not see the Folder tools

