*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup    OpenBrowser    about:blank    chrome
Suite Teardown    CloseAllBrowsers

*** Test Cases ***
Basket delete
   [Documentation]    delete all the items and check they were deleted
   GoTo    https://www.saucedemo.com/
   Log into    ${STANDARD_USER_LOGIN}    ${PASSWORD}
   