*** Settings ***
Library     Selenium2Library
Resource    ../Pages/HomePage.robot
Resource    ../Pages/FormPage.robot
Resource    ../Pages/ErrorPage.robot
Resource    ../Resources/Commons.robot
Resource    TestData.robot

Suite Setup      Open Browser  ${HOME_URL}      Chrome
#Suite Teardown   Close Browser

*** Test Cases ***
Setup
    Set Selenium Speed              0.02 seconds
    Maximize Browser Window

Title of home page is correct
    Given Home page is open
    Then Title should be correct

Title of form page is correct
    Given Form page is open
    Then Title should be correct

Company logo is shown on home page
    Given Home page is open
    Then Company logo is shown

Company logo is shown on form page
    Given Form page is open
    Then Company logo is shown

Button statuses are correct
    Given Home page is open
    Then Home button has active class

    Given Form page is open
    Then Form button has active class

User is navigated to home page after click on UI Testing button
    Given Home page is open
    Then User clicks on UI Testing

Home page heading text is visible
    Given Home page is open
    Then Heading text is shown

Home page paragraph text is visible
    Given Home page is open
    Then Paragraph text is shown

Form page has one input box and one submit button
    Given Form page is open
    Then There is one input box
    And There is one submit button

User submits form
    [Template]  Given Form page is open When ${USER} submits form Then ${MESSAGE} is shown
    John        Hello John!
    Sophia      Hello Sophia!
    Charlie     Hello Charlie!
    Emily       Hello Emily!

User gets error on error page
    Given Error page is open
    Then User gets 404 error code