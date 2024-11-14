*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/RankingPage.py

*** Keywords ***
Setup Ranking Page
    [Documentation]    Open and setup ranking page
    RankingPage.Set Driver    ${driver}
    RankingPage.Get Url    ${BASE_URL}/ranking/film
    RankingPage.Reject Cookies
    RankingPage.Skip Advertising

Check Ranking Page Display
    Ranking Visibility
    Ranking Element Visibility
    RankingPage.Scroll All Page
    Is Number Ranking Elements Count Correct

Ranking Visibility
    ${is_visible}    RankingPage.Display Ranking
    Should Be True    ${is_visible}

Ranking Element Visibility
    ${is_visible}    RankingPage.Display Ranking Element
    Should Be True    ${is_visible}

Is Number Ranking Elements Count Correct
    ${number}    RankingPage.Number Of Elements
    Should Be Equal As Integers    ${number}    500
