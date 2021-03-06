*** Settings ***
Library     Selenium2Library
Resource    ../Pages/Page.robot
Resource    ../TestCases/TestData.robot

*** Variables ***
${HEADING_TEXT_ELEMENT}         xpath: //h1
${PARAGRAPH_TEXT_ELEMENT}       xpath: //p

*** Keywords ***
Home page is open
    ${RESULT}=   Run Keyword And Ignore Error   Element Text Should Be      ${PARAGRAPH_TEXT_ELEMENT}   ${PARAGRAPH_TEXT}
    Run Keyword If  '${RESULT[0]}'=='PASS'      Element Text Should Be      ${HEADING_TEXT_ELEMENT}     ${HEADING_TEXT}
    ...     ELSE        Go To   ${HOME_URL}

Title should be correct
    Title Should Be     ${TITLE_NAME}

Company logo is shown
    Element exists      ${COMPANY_LOGO}

Home button has active class
    Element has active class in parent   home

User clicks on UI Testing
    Click on UI Testing button

Heading text is shown
    Element Text Should Be      ${HEADING_TEXT_ELEMENT}         ${HEADING_TEXT}

Paragraph text is shown
    Element Text Should Be      ${PARAGRAPH_TEXT_ELEMENT}       ${PARAGRAPH_TEXT}