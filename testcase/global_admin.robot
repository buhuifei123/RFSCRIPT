*** Settings ***
Library           RequestsLibrary
Resource          ../variables/global-admin环境.txt
Resource          ../keywords/global_admin.txt
Library           ../library/MyClass.py
Library           DatabaseLibrary
Resource          ../keywords/数据库操作.txt

*** Test Cases ***
001后台类目列表
    Comment    ${token}    登录
    Comment    ${header}    Create Dictionary    content-type=application/json    origin=${origin}    Authorization=Bearer ${token}
    Comment    create session    host    ${host}    headers=${header}
    ${res}    admin_get请求    /admin/category/backendList
    should be equal    '${res.status_code}'    '200'
    Comment    log    ${res.json()}
    Should Contain    '${res.json()['msg']}'    '请求成功'
    Should Not Be Empty    ${res.json()['data']}

连接gmp_test数据库
    连接global-gmp_test数据库
    @{b}    Query    select id from t_uic_shop where user_id=100
    FOR    ${i}    IN    @{b}
        Should Be Equal    '${i[0]}'    '100'
    END
    断开数据库
    连接力宝bbmall_xforce_test数据库
    断开数据库
