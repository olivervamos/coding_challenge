*** Settings ***
Resource    ../resources/keywords.robot
Library    ../libraries/custom_keywords.py
Test Setup    Setup Browser
Test Teardown    Close Browser

*** Variables ***
@{times_standard_user}
@{times_problem_user}
@{times_performance_glitch_user}



*** Test Cases ***
Login speed every user
    Get users credentials
    Login speed list    ${STANDARD_USER_LOGIN}    ${PASSWORD}    ${times_standard_user}
    Login speed list    ${PROBLEM_USER_LOGIN}    ${PASSWORD}    ${times_problem_user}
    Login speed list    ${PERFORMANCE_GLITCH_USER_LOGIN}    ${PASSWORD}    ${times_performance_glitch_user}
    ${average_time_standard_user}    Make Average    ${times_standard_user}
    ${average_time_problem_user}    Make Average    ${times_problem_user}
    ${average_time_performance_glitch_user}    Make Average    ${times_performance_glitch_user}
    ${data}    Report Data    standard user    ${average_time_standard_user}    ${times_standard_user}    
    ...    problem user    ${average_time_problem_user}    ${times_problem_user}    
    ...    performance glitch user    ${average_time_performance_glitch_user}    ${times_performance_glitch_user}
    ${first_time}    First Time    ${data}
    ${second_time}    Second Time    ${data}
    ${third_time}    Third Time    ${data}
    Create File    ${EXECDIR}/login_times.txt    Best average time: ${first_time}\r${Second Time}\rworst average time: ${third_time}