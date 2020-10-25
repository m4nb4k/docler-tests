*** Settings ***
Library     Selenium2Library
Resource    ../TestCases/TestData.robot

*** Variables ***
${COMPANY_LOGO}           xpath: //img[@id='dh_logo']
${HOME_BUTTON}            xpath: //a[@id='home']
${FORM_BUTTON}            xpath: //a[@id='form']
${ERROR_BUTTON}           xpath: //a[@id='error']
${UI_BUTTON}              xpath: //a[@id='site']

*** Keywords ***
Click on Home button
    Click on element                ${HOME_BUTTON}
    Location Should Be              ${HOME_URL}

Click on Form button
    Click on element                ${FORM_BUTTON}
    Location Should Be              ${FORM_URL}

Click on Error button
    Click on element                ${ERROR_BUTTON}
    Location Should Be              ${ERROR_URL}

Click on UI Testing button
    Click on element                ${UI_BUTTON}
    Location Should Be              ${HOME_URL}

Element has active class in parent
    [Arguments]                     ${ELEMENT}
    ${result}=    Execute Javascript  return $(${ELEMENT}).parent().hasClass('active')
    Should Be Equal as strings      ${result}   True