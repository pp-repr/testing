*** Settings ***
Resource    ../resources/setup_teardown.resource
Library    ../pages/LoginPage.py
Variables    ../lib/config.py

*** Variables ***
${METHOD}    FILMWEB

*** Keywords ***
Setup Login Page
    [Documentation]    Setup login page
    LoginPage.Set Driver    ${driver}
    LoginPage.Get Url    ${BASE_URL}
    LoginPage.Reject Cookies
    LoginPage.Skip Advertising
    LoginPage.Click Login Button

Setup Main Page With Cookies
    [Documentation]    Run main page with adding cookies
    LoginPage.Set Driver    ${driver}
    LoginPage.Add Cookies To Driver    ${COOKIES_FILE}
    LoginPage.Get Url    ${BASE_URL}

Log in With Valid Credentials
    [Documentation]    Login valid data
    LoginPage.Choose Login Method    ${METHOD}
    LoginPage.Enter Username    ${EMAIL}
    LoginPage.Enter Password    ${PASSWORD}
    LoginPage.Submit Login Data
    LoginPage.Save Cookies    ${COOKIES_FILE}

Check User Avatar Visibility
    [Documentation]    Verify avatar
    ${avatar}    LoginPage.Find Avatar
    Should Not Be Equal As Strings      ${avatar}    ${None}

Verify Cookies File Is Not Empty
    [Documentation]    Checks if cookies are saved or if the file is empty
    ${cookies}    LoginPage.Read Cookies    ${COOKIES_FILE}
    Should Not Be Empty    ${cookies}

Log in With Invalid Credentials
    [Documentation]    Login invalid data
    LoginPage.Choose Login Method    ${METHOD}
    LoginPage.Enter Username    ${INVALID_EMAIL}
    LoginPage.Enter Password    ${INVALID_PASSWORD}
    LoginPage.Submit Login Data
    ${message}    LoginPage.Get Error Message
    Should Contain    ${message}    Nieprawidłowy login lub hasło!

