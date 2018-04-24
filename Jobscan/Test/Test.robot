*** Settings ***
Library  Selenium2Library
Suite Setup  Go to jobscan
Suite Teardown  Exit Test

*** Keywords ***
Go to jobscan
    [Documentation]
    Open browser   https://www.jobscan.fi    chrome
    Maximize browser Window

Exit Test
    close all browsers

Login
    [Documentation]    Login using existing account
    [Arguments]    ${Username}    ${Password}
    click Element    xpath=//*[@class='member-links member-login-link']
    sleep    5s
    input text    log    ${Username}
    input Password    pwd    ${Password}
    click button    Sign In
    sleep    10s
    Wait Until Page Contains    Post a Resume    timeout=30

Change Password
    [Documentation]    Change password
    [Arguments]    ${OldPassword}    ${NewPassword}

    input text    old_pass    ${OldPassword}
    input text    new_pass     ${NewPassword}
    input text    new_pass_confirm    ${NewPassword}
    click button    Save New Password
    sleep    10s


Logout
    [Documentation]    Signout from webpage
    mouse over     xpath=//*[@class='profile-name']
    sleep    3s
    click element       xpath=//*[@id="menu-main-menu"]/li[3]/ul/li[11]
    sleep    5s
    Wait Until Page Contains    Login    timeout=30

*** Test Cases ***

Change Password Test
    Login    testuserssh@outlook.com    testuserssh2
    mouse over     xpath=//*[@class='profile-name']
    sleep    5s
    click element       xpath=//*[@id="menu-main-menu"]/li[3]/ul/li[10]
    sleep    5s
    Change Password   testuserssh2    testuserssh1
    sleep    5s





