*** Settings ***
Resource          ../resources/movie_keyword.resource
Suite Setup       setup_teardown.Setup Browser With Cookies
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for check details films and tv series on Filmweb

*** Test Cases ***

Rate Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    ADD     RATE
    [Template]    Rate Film Or Tv Show
    Lista Schindlera    6
    Służące    7
    Coco    8

Change Rate Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    CHANGE    RATE
    [Template]    Change Rate Film Or Tv Show
    Lista Schindlera    7
    Służące    6
    Coco    9

Delete Rate Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    DELETE    RATE
    [Template]    Delete Rate Film Or Tv Show
    Lista Schindlera
    Służące
    Coco

Add to Favorites Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    FAV
    [Template]    Add to Favorites Film Or Tv Show
    Pianista
    Bogowie
    Aida

Delete From Favorites Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    DEL_FAV
    [Template]    Delete From Favorites Film Or Tv Show
    Pianista
    Bogowie
    Aida

Add To Want Watch Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    WATCH
    [Template]    Add To Want Watch Film Or Tv Show
    Pianista
    Bogowie
    Aida

Delete From Want Watch Multiple Films Or Tv Shows
    [Documentation]
    [Tags]    DEL_WATCH
    [Template]    Delete From Want Watch Film Or Tv Show
    Pianista
    Bogowie
    Aida
