*** Settings ***
Documentation   Login teste suite

Resource    ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*** Test Cases ***
User login

    ${user}                  Factory User Login
    ### REPASSEI PRO DELORIAN:
    # Add User From Database   ${user}

    Go To Login Page
    Fill Credentials     ${user}
    Submit Credentials
    User Should Be Logged In   ${user}

Incorrect Pass

    [Tags]    inv_pass

    ${user}   Create Dictionary  email=carlos.souza@email.com   password=abc123  

    Go To Login Page
    FIll Credentials   ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

User not found

    [Tags]    user_404

    ${user}   Create Dictionary  email=papito@404.net   password=abc123  

    Go To Login Page
    FIll Credentials   ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorret Email

    [Tags]    inv_email

    ${user}   Create Dictionary  email=papito.com.br   password=abc123  

    Go To Login Page
    FIll Credentials   ${user}
    Submit Credentials
    Should Be Type Email