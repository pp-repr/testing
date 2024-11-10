*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/SearchPage.py

*** Keywords ***
Setup Search Page
    [Documentation]    Open search window
    SearchPage.Set Driver    ${driver}
    SearchPage.Open Search Window

Search Films Or Tv Show
    [Documentation]
    [Arguments]    ${title}
    Setup Search Page
    Enter Value Into Search Input    ${title}
    Title Should Be Correct    ${title}

Search Actor
    [Documentation]
    [Arguments]    ${name}
    Setup Search Page
    Enter Value Into Search Input    ${name}

Enter Value Into Search Input
    [Documentation]
    [Arguments]    ${name}
    SearchPage.Enter Search Input    ${name}
    SearchPage.Click Element Field    ${name}
    ${current_url}    SearchPage.Check Current Url
    ${encoded_name}    Evaluate    urllib.parse.quote_plus("${name}")
    Log Many    ${current_url}     ${encoded_name}
    Should Contain    ${current_url}    ${encoded_name}

Title Should Be Correct
    [Documentation]
    [Arguments]    ${name}
    ${title}    SearchPage.Get Title
    Should Be Equal As Strings   ${name}    ${title}
