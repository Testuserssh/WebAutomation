*** Settings ***
Library  Selenium2Library
Suite Setup  Go to jobscan
Suite Teardown  Exit Test

*** Keywords ***
Go to jobscan
    [Documentation]
    Open browser   https://www.jobscan.fi    firefox
    Maximize browser Window

Exit Test
    close all browsers

*** Test Cases ***
Login
    [Documentation]    Login using existing account
    click Element    xpath=//*[@class='member-links member-login-link']
    sleep    3s
    input text    log    testuserssh@outlook.com
    input Password    pwd    testuserssh
    click button    Sign In
    sleep    5s
    Wait Until Page Contains    Post a Resume    timeout=30
