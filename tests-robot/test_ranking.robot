*** Settings ***
Resource          ../resources/ranking_keyword.resource
Suite Setup       setup_teardown.Setup Browser
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for Filmweb's rankings

*** Test Cases ***

Check of Correct Ranking Loading
    [Documentation]    Checks if ranking and ranking elements have loaded correctly.
    [Setup]    Setup Ranking Page
    [Tags]    RANKING
    Check Ranking Page Display
