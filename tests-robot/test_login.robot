*** Settings ***
Resource    ../resources/setup_teardown.resource
Resource    ../resources/login_keyword.resource

*** Test Cases ***
Verify Valid Login Attempt
    [Documentation]    This test verifies that a user can log in with valid credentials.
    Setup Browser
    Setup Login Page
    Login With Valid Credentials
    Check User Avatar Visibility
    Verify Cookies File Is Not Empty
    Teardown Browser

Verify Invalid Login Attempt
    [Documentation]    This test verifies that a user can log in with invalid credentials.
    Setup Browser
    Setup Login Page
    Log in With Invalid Credentials
    Teardown Browser

Verify Valid Login With Cookies
    [Documentation]    This test verifies that a user can successfully log in using saved cookies.
    Setup Browser
    Setup Main Page With Cookies
    Check User Avatar Visibility
    Teardown Browser
