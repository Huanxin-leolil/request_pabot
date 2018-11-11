*** Settings ***
Library           RequestsLibrary
Resource          resource.robot

*** Test Cases ***
api.github.com
    # request http://api.github.com
    ${resp}=    Get Request    ${session}    /
    Should Be Equal As Strings    ${resp.status_code}    200
    log    ${resp.text}
