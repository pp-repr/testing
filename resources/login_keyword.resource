*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/LoginPage.py
Variables    ../lib/config.py

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

Log Into Page By Filmweb
    [Documentation]    Login with data
    [Arguments]    ${email}    ${password}    ${cookies}=${False}    
    LoginPage.Choose Login Method    FILMWEB
    LoginPage.Enter Username    ${email}
    LoginPage.Enter Password    ${password}
    LoginPage.Submit Login Data
    IF    $cookies == $True
        LoginPage.Save Cookies    ${COOKIES_FILE}
    END

Avatar Should Be Visible
    [Documentation]    Verify avatar
    ${avatar}    LoginPage.Find Avatar
    Should Not Be Equal As Strings      ${avatar}    ${None}

Get Cookies From File
    [Documentation]    Checks if cookies are saved or if the file is empty
    ${cookies}    Run Keyword And Return Status    LoginPage.Read Cookies    ${COOKIES_FILE}
    RETURN    ${cookies}

Get And Return Error Message
    [Documentation]    Get error message from login window
    ${error_message}    LoginPage.Get Error Message
    RETURN    ${error_message}
