*** Settings ***
Library     Selenium2Library
Resource    ../Pages/Page.robot
Resource    ../TestCases/TestData.robot

*** Variables ***
${ERROR_HEAD_ELEMENT}           xpath: //h1
${ERROR_PARAGRAPH_TEXT}         Through the magic of digital telecommunications, your wrong credential is now winging its way to the maintainer.

*** Keywords ***
Error page is open
    ${RESULT}=   Run Keyword And Ignore Error       Title Should Be     ${ERROR_PAGE_TITLE}
    Run Keyword If  '${RESULT[0]}'=='PASS'     Click on Error button
    Go To   ${ERROR_URL}
    Location Should Be  ${ERROR_URL}

User gets 404 error code
    Page Should Contain     File not found
    Title Should Be         ${ERROR_PAGE_TITLE}