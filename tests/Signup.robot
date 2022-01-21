*** Settings ***
Documentation   Signup Test Suite

Resource  ${EXECDIR}/resources/Base.robot

Test Setup     Start Session
Test Teardown  Finish Session

*** Test Cases ***
Register a new user

    ${user}  Factory User

    Go To Signup form
    Fill Signup Form  ${user}
    Submit Signup Form
    User Should Be Registered

Duplicate user

    [Tags]     attempt_signup

    ${user}                  Factory User

    Add User From Database   ${user}

    Go To Signup form
    Fill Signup Form  ${user}
    Submit Signup Form
    Modal Content Shpuld Be  Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]        attempt_signup

    ${user}       Factory Wrong Email

    Go To Signup form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  O email está estranho

Required Fields
    [Tags]        attempt_signup  reqf

    @{expected_alerts}  Create List
    ...                 Cadê o seu nome?
    ...                 E o sobrenome?
    ...                 O email é importante também!
    ...                 Agora só falta a senha!

    Go To Signup form
    Submit Signup Form
    Alert Spans Should Be    ${expected_alerts}

Short password

    [tags]          attempt_signup   short_pass
    [Template]      Signup With Short Pass
    1
    12
    123
    1234
    12345
    a2
    -1
    bb

*** Keywords ***
Signup With Short Pass
   [Arguments]   ${short_pass}

    ${user}    Create Dictionary
    ...        name=Carlos               lastname=Souza
    ...        email=papito@hotmail.com  password=12345

    Go To Signup form
    Fill Signup Form  ${user}
    Submit Signup Form
    Alert Span Should Be  Informe uma senha com pelo menos 6 caracteres














