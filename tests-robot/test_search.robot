*** Settings ***
Resource          ../resources/search_keyword.resource
Suite Setup       setup_teardown.Setup Browser With Cookies
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for search films, tv series, actors on Filmweb

*** Test Cases ***
Search Films
    [Documentation]
    [Tags]    FILM
    Setup Search Page
    Enter Value Into Search Input    Ród smoka
