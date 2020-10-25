*** Settings ***
Library     Selenium2Library
Resource    ../Pages/Page.robot
Resource    ../TestCases/TestData.robot

*** Variables ***
${ERROR_HEAD_ELEMENT}           xpath: //h1

*** Keywords ***
Error page is open
    ${RESULT}=   Run Keyword And Ignore Error       Page Should Contain Element      ${ERROR_HEAD_ELEMENT}
    Run Keyword Unless  '${RESULT[0]}'=='PASS'     Click on Error button
    Go To   ${ERROR_URL}
    Location Should Be  ${ERROR_URL}

User gets 404 error code
    Page Should Contain     File not found