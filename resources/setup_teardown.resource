*** Settings ***
Library    ../lib/utilities.py
Library    ../lib/config.py
Library    ../pages/BasePage.py
Resource   ../resources/login_keyword.resource

*** Keywords ***
Setup Browser
    [Documentation]    Open browser Chrome using create_driver from utilities.py
    ${driver}    Create Driver
    Set Suite Variable    ${driver}

Setup Browser With Cookies
    [Documentation]   Open browser Chrome using cookies (working when cookies are fresh) 
    ${driver}    Create Driver
    ${is_cookies}    Get Cookies From File
    Skip If    $is_cookies == ${False}    Cookies file not found
    BasePage.Set Driver    ${driver}
    BasePage.Add Cookies To Driver    ${COOKIES_FILE}
    BasePage.Get Url    ${BASE_URL}
    Set Suite Variable    ${driver}

Teardown Browser
    [Documentation]    Close browser
    Run Keyword If    ${driver}    Close Browser

Close Browser
    Call Method    ${driver}    quit