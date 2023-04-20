*** Settings ***
Library    QWeb
Library    String

*** Variables ***
${input_username}    //input[contains(@placeholder, 'Username')]
${input_password}    //input[contains(@placeholder, 'Password')]
${button_login}    //input[contains(@data-test, 'login-button')]
${xpath_users}    //div[@id = "login_credentials"][1]
${xpath_password}    //div[@class='login_password']

*** Keywords ***
Get users credentials
    [Documentation]    Get all users as text
    #GoTo   https://www.saucedemo.com/
    ${STANDARD_USER_LOGIN}    Get Text    ${xpath_users}    between=are:???locked
    ${LOCKED_OUT_USER_LOGIN}    Get Text    ${xpath_users}    between=user???problem
    ${PROBLEM_USER_LOGIN}    Get Text    ${xpath_users}    between=user???performance
    ${PERFORMANCE_GLITCH_USER_LOGIN}    Get Text    ${xpath_users}    between=problem_user???
    ${PASSWORD}    GetText    ${xpath_password}    between=users:???
    Set Test Variable    ${STANDARD_USER_LOGIN}
    Set Test Variable    ${LOCKED_OUT_USER_LOGIN}
    Set Test Variable    ${PROBLEM_USER_LOGIN}
    Set Test Variable    ${PERFORMANCE_GLITCH_USER_LOGIN}
    Set Test Variable    ${PASSWORD}

Log into
    [Arguments]    ${login_username}    ${login_password}
    TypeText    ${input_username}    ${login_username}
    TypeText    ${input_password}    ${login_password}
    ClickElement    ${button_login}

Sorting high to low
    