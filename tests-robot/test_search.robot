*** Settings ***
Library           Collections
Resource          ../resources/search_keyword.resource
Suite Setup       setup_teardown.Setup Browser With Cookies
Suite Teardown    setup_teardown.Teardown Browser
Documentation     Test Suite for search films, tv series, actors on Filmweb

*** Test Cases ***
Search Multiple Films or Tv Show
    [Documentation]    Searches for movies and TV shows in Filmweb search engine
    [Tags]    FILMS
    [Template]    Search Films Or Tv Show
    Ród smoka
    Zielona mila
    Nietykalni
    Gra o tron

Search Multiple Actors
    [Documentation]    Searches for actors in Filmweb search engine
    [Tags]    PERSON
    VAR    @{actors}    Angelina Jolie    Al Pacino    Cillian Murphy
    FOR  ${actor}  IN  @{actors}
        Search Actor    ${actor}
    END
