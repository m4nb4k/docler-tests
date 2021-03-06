*** Settings ***
Library     Selenium2Library
Resource    ../Pages/HomePage.robot
Resource    ../Pages/FormPage.robot
Resource    ../Pages/ErrorPage.robot
Resource    ../Resources/Commons.robot
Resource    TestData.robot

Suite Setup      Open Browser  ${HOME_URL}      Chrome
Suite Teardown   Close Browser

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

Home page button status is correct
    Given Home page is open
    Then Home button has active class

Form page button status is correct
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

Form page has one input box
    Given Form page is open
    Then There is one input box

Form page has one submit button
    Given Form page is open
    And There is one submit button

User submits form
    [Template]  Given Form page is open When ${USER} submits form Then ${MESSAGE} is shown
    John        Hello John!
    Sophia      Hello Sophia!
    Charlie     Hello Charlie!
    Emily       Hello Emily!
    M           Hello M!
    ${EMPTY}    Hello !
    MaNt4S      Hello MaNt4S!
    Ma ntas     Hello Ma ntas!
    日本日本      Hello 日本日本!
    3113        Hello 3113!
    123aaaaaaaaaaaaaaaaaaaa2222222222222222222222222222222222222222  Hello 123aaaaaaaaaaaaaaaaaaaa2222222222222222222222222222222222222222!
    aa!@$%$<>   Hello aa!@$%<>!
    aa{}[]      Hello aa{}[]!
    aa(*+-/     Hello aa(*+-/!
    ${XML}      Hello ${XML}!

User gets error on error page
    Given Error page is open
    Then User gets 404 error code