*** Settings ***
Resource          ../resources/movie_keyword.resource
Suite Setup       setup_teardown.Setup Browser With Cookies
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for check details films and tv series on Filmweb

*** Test Cases ***

Rate Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    RATE
    [Template]    Rate Film Or Tv Show
    Lista Schindlera    6
    Służące    7
    Arcane    8
