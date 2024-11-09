*** Settings ***
Resource          ../resources/login_keyword.resource
Suite Setup       setup_teardown.Setup Browser
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for Filmweb login      

*** Test Cases ***
Verify Valid Login With Credentials
    [Documentation]   Verifies if user can log in using valid credentials.
    [Setup]    Setup Login Page
    [Tags]    LOGIN_VALID
    Log Into Page By Filmweb    ${VALID_EMAIL}    ${VALID_PASSWORD}    ${True}
    Avatar Should Be Visible
    ${is_cookies}    Get Cookies From File
    Should Be True    ${is_cookies}

Verify Invalid Login With Credentials
    [Documentation]   Verifies if user can log in using invalid credentials.
    [Setup]    Setup Login Page
    [Tags]    LOGIN_INVALID
    Log Into Page By Filmweb    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    ${error_message}    Get And Return Error Message
    Should Contain    ${error_message}    Nieprawidłowy login lub hasło!

Verify Valid Login With Cookies
    [Documentation]   Verifies if user can successfully log in using saved cookies.
    [Tags]    LOGIN_COOKIES
    ${is_cookies}    Get Cookies From File
    Skip If    $is_cookies == ${False}    Cookies file not found
    Setup Main Page With Cookies
    Avatar Should Be Visible
