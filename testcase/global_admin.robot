*** Settings ***
Library           RequestsLibrary
Resource          ../variables/global-admin环境.txt
Resource          ../keywords/global_admin.txt
Library           ../library/MyClass.py
Library           DatabaseLibrary

*** Test Cases ***
001查询添加人列表下拉(搜索入参)
    Comment    ${token}    登录
    Comment    ${header}    Create Dictionary    content-type=application/json    origin=${origin}    Authorization=Bearer ${token}
    Comment    create session    host    ${host}    headers=${header}
    创建session
    ${res}    GET On Session    host    /admin/common/creators
    should be equal    '${res.status_code}'    '200'
    Comment    log    ${res.json()}
    Should Contain    '${res.json()['msg']}'    '请求成功'
    Should Not Be Empty    ${res.json()['data']}

连接数据库
    Connect To Database Using Custom Params    pymysql    database='gmp_test',user='gmp',password='gmp',host='mysql-0.mysql.bbmall-middleware.svc.cluster.bbmall',port=3306
    @{b}    Query    select id from t_uic_shop where user_id=100
    FOR    ${i}    IN    @{b}
        Printmsg    ${i[0]}
    END
    Disconnect From Database
