*** Settings ***
Resource          ../resources/ranking_keyword.resource
Suite Setup       setup_teardown.Setup Browser
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for Filmweb's rankings

*** Test Cases ***

Check of Correct Ranking Loading
    [Documentation]
    [Setup]    Setup Ranking Page
    [Tags]    RANKING
    Check Ranking Page Display
