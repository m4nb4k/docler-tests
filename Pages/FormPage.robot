*** Settings ***
Library     Selenium2Library
Resource    Page.robot

*** Variables ***
${FORM_PAGE_HEAD}   xpath: //h1
${INPUT_BOX}        xpath: //input[@id='hello-input']
${SUBMIT_BUTTON}    xpath: //button[@id='hello-submit']
${FORM_SUBMIT_URL}  http://uitest.duodecadits.com/hello.html?myName=

*** Keywords ***
Form page is open
    ${RESULT}=   Run Keyword And Ignore Error   Page Should Contain Element      ${FORM_PAGE_HEAD}
    Run Keyword If  '${RESULT[0]}'=='PASS'     Click on Form button
    Go To   ${FORM_URL}
    Element Text Should Be      ${FORM_PAGE_HEAD}       ${FORM_HEAD_TEXT}

Form button has active class
    Element has active class in parent   form

There is one input box
    ${count}=       Get Element Count       ${INPUT_BOX}
    Should Be Equal as integers             ${count}   1

There is one submit button
    ${count}=       Get Element Count       ${SUBMIT_BUTTON}
    Should Be Equal as integers             ${count}   1

Given Form page is open When ${USER} submits form Then ${MESSAGE} is shown
    Go To   ${FORM_URL}
    Enter text              ${INPUT_BOX}        ${USER}
    Click on element        ${SUBMIT_BUTTON}
    Location Should Be      ${FORM_SUBMIT_URL}${USER}
    Element Text Should Be  ${FORM_PAGE_HEAD}   ${MESSAGE}

User submits form
    [Arguments]             ${VALUE}
    Enter text              ${INPUT_BOX}        ${VALUE}
    Click on element        ${SUBMIT_BUTTON}
    Location Should Be      ${FORM_SUBMIT_URL}${VALUE}

User is shown message
    [Arguments]             ${RESULT}
    Element Text Should Be  ${FORM_PAGE_HEAD}   ${RESULT}

