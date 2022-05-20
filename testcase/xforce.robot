*** Settings ***
Library           RequestsLibrary
Library           SeleniumLibrary
Resource          ../variables/力宝xforce环境.txt
Resource          ../keywords/力宝xforce.txt

*** Test Cases ***
001
    登录

002
    ${res}    xforce_post请求    data={}
    Comment    log    ${res.json()}
    Should Be Equal    '${res.json()['data']['userId']}'    '102990'
