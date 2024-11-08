*** Settings ***
Library    ../lib/utilities.py
Library    ../lib/config.py

*** Keywords ***
Setup Browser
    [Documentation]    Open browser Chrome using create_driver from utilities.py
    ${driver}    Create Driver
    Set Suite Variable    ${driver}

Teardown Browser
    [Documentation]    Close browser
    Run Keyword If    ${driver}    Close Browser

Close Browser
    Call Method    ${driver}    quit