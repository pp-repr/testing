*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/MoviePage.py
Library      urllib.parse
Variables    ../lib/config.py

*** Keywords ***

Rate Film Or Tv Show
    [Documentation]
    [Arguments]    ${title}    ${rate}
    Open Film Or Tv Show Page    ${title}
    Give Star In Rating Section    ${rate}

Open Film Or Tv Show Page
    [Documentation]
    [Arguments]    ${title}
    MoviePage.Set Driver    ${driver}
    MoviePage.Get Url    ${BASE_URL}/search#/?query=${title}
    MoviePage.Open Page    ${title}

Give Star In Rating Section
    [Documentation]
    [Arguments]    ${rate}
    MoviePage.Scroll To Rating Section
    ${element}    MoviePage.Check Rate
    IF  "${element}" == "moja ocena:"
        MoviePage.Rate Film    ${rate}
    ELSE IF    "${element}" == "brak oceny"
        MoviePage.Rate Film    ${rate}
    ELSE
        Fail
    END
    ${element}    MoviePage.Check Rate
    IF  "${element}" == "moja ocena:"
        Fail
    ELSE IF    "${element}" == "brak oceny"
        Fail
    END
