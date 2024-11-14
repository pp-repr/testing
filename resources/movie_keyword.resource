*** Settings ***
Resource     ../resources/setup_teardown.resource
Library      ../pages/MoviePage.py
Library      urllib.parse
Variables    ../lib/config.py

*** Keywords ***

Rate Film Or Tv Show
    [Arguments]    ${title}    ${rate}
    Open Film Or Tv Show Page    ${title}
    Give Star In Rating Section    ${rate}

Change Rate Film Or Tv Show
    [Arguments]    ${title}    ${rate}
    Open Film Or Tv Show Page    ${title}
    Change Star In Rating Section    ${rate}

Delete Rate Film Or Tv Show
    [Arguments]    ${title}
    Open Film Or Tv Show Page    ${title}
    Delete Star In Rating Section

Add to Favorites Film Or Tv Show
    [Arguments]    ${title}
    Open Film Or Tv Show Page    ${title}
    Give Heart In Rating Section

Delete From Favorites Film Or Tv Show
    [Arguments]    ${title}
    Open Film Or Tv Show Page    ${title}
    Delete Heart In Rating Section

Add To Want Watch Film Or Tv Show
    [Arguments]    ${title}
    Open Film Or Tv Show Page    ${title}
    Click Want Watch Option In Rating Section

Delete From Want Watch Film Or Tv Show
    [Arguments]    ${title}
    Open Film Or Tv Show Page    ${title}
    Uncheck Want Watch Option In Rating Section

Give Heart In Rating Section
    MoviePage.Scroll To Rating Section
    ${is_heart_clicked}    MoviePage.Is Heart Clicked
    Should Not Be True   ${is_heart_clicked}
    MoviePage.Give Heart
    ${is_heart_clicked}    MoviePage.Is Heart Clicked
    Should Be True    ${is_heart_clicked}

Delete Heart In Rating Section
    MoviePage.Scroll To Rating Section
    ${is_heart_clicked}    MoviePage.Is Heart Clicked
    Should Be True    ${is_heart_clicked}
    MoviePage.Delete Heart
    ${is_heart_clicked}    MoviePage.Is Heart Clicked
    Should Not Be True    ${is_heart_clicked}

Click Want Watch Option In Rating Section
    MoviePage.Scroll To Rating Section
    ${is_want_watch_clicked}    MoviePage.Is Want Watch Clicked
    Should Not Be True   ${is_want_watch_clicked}
    MoviePage.Click Want Watch Option
    ${is_want_watch_clicked}    MoviePage.Is Want Watch Clicked
    Should Be True    ${is_want_watch_clicked}

Uncheck Want Watch Option In Rating Section
    MoviePage.Scroll To Rating Section
    ${is_want_watch_clicked}    MoviePage.Is Want Watch Clicked
    Should Be True    ${is_want_watch_clicked}
    MoviePage.Cancel Want Watch Option
    ${is_want_watch_clicked}    MoviePage.Is Want Watch Clicked
    Should Not Be True    ${is_want_watch_clicked}

Open Film Or Tv Show Page
    [Arguments]    ${title}
    MoviePage.Set Driver    ${driver}
    MoviePage.Get Url    ${BASE_URL}/search#/?query=${title}
    MoviePage.Open Page    ${title}

Give Star In Rating Section
    [Arguments]    ${rate}
    MoviePage.Scroll To Rating Section
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${True}
        Fail    msg=Film has rate but shouldn't
    END
    MoviePage.Rate Film    ${rate}
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${False}
        Fail    msg=Film hasn't rate but should
    END

Change Star In Rating Section
    [Arguments]    ${rate}
    MoviePage.Scroll To Rating Section
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${False}
        Fail    msg=Film hasn't rate but should
    END
    MoviePage.Change Rate Film    ${rate}
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${False}
        Fail    msg=Film hasn't rate but should
    END

Delete Star In Rating Section
    MoviePage.Scroll To Rating Section
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${False}
        Log    Film has not rate
        Fail    msg=Film hasn't rate but should
    END
    MoviePage.Delete Rate
    ${is_visible}    Is Visible Rate
    IF  ${is_visible} == ${True}
        Fail    msg=Film has rate but shouldn't
    END

Is Visible Rate
    ${element}    MoviePage.Check Rate
    IF  "${element}" == "moja ocena:"
        RETURN    ${False}
    ELSE IF    "${element}" == "brak oceny"
        RETURN    ${False}
    END
    RETURN    ${True}
