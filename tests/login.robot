*** Settings ***
Resource    ../resources/keywords.robot
Test Setup    Setup Browser
Test Teardown    Close Browser

*** Test Cases ***

login
    [Documentation]    Verifies that login works
   GoTo   https://www.saucedemo.com/
   Get users credentials
   Log into    ${STANDARD_USER_LOGIN}    ${PASSWORD}
   VerifyText    Products