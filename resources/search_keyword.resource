*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/SearchPage.py

*** Keywords ***
Setup Search Page
    [Documentation]    Open search window
    SearchPage.Set Driver    ${driver}
    SearchPage.Open Search Window

Enter Value Into Search Input
    [Documentation]
    [Arguments]    ${name}
    SearchPage.Enter Search Input    ${name}
    SearchPage.Click Element Field    ${name}
    ${current_url}    SearchPage.Check Current Url
    ${encoded_name}    Evaluate    urllib.parse.quote_plus("${name}")
    Log Many    ${current_url}     ${encoded_name}    
    Should Contain    ${current_url}    ${encoded_name}
    ${title}    SearchPage.Get Title
    Should Be Equal As Strings   ${name}    ${title}
