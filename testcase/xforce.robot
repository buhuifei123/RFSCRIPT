*** Settings ***
Library           RequestsLibrary
Library           SeleniumLibrary
Resource          ../variables/力宝xforce环境.txt
Resource          ../keywords/力宝xforce.txt

*** Test Cases ***
001
    登录

002
    ${token}    登录
    ${header}    Create Dictionary    Origin=http://xforce.gsp-test.ebms.xy    Authorization=Bearer ${token}
    create session    url    http://api-xforce.gsp-test.ebms.xy    headers=${header}
    ${res}    POST On Session    url    /app/personalCenter/personalCenterDetail
    Comment    log    ${res.json()}
    Should Be Equal    '${res.json()['data']['userId']}'    '102990'
