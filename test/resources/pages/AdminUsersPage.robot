*** Settings ***
Library    Browser
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/AdminUsersPage.robot
Resource   ../resources/common/util.robot

Suite Setup       Start Browser And Login As Admin
Suite Teardown    Close Browser

*** Variables ***
${EMPLOYEE_NAME}      Paul Collings
${USERNAME}           qa_user_test_01
${NEW_USERNAME}       qa_user_test_01_edit
${PASSWORD}           Test@1234


*** Test Cases ***
CRUD Completo Usuário Admin
    [Documentation]    Fluxo completo: Criar, Buscar, Editar e Excluir usuário no módulo Admin

    Open Admin Users

    Create User
    ...    ${EMPLOYEE_NAME}
    ...    ${USERNAME}
    ...    ${PASSWORD}
    ...    ESS
    ...    Enabled

    Search User By Username    ${USERNAME}
    Assert User Present        ${USERNAME}

    Edit User Username
    ...    ${USERNAME}
    ...    ${NEW_USERNAME}

    Search User By Username    ${NEW_USERNAME}
    Assert User Present        ${NEW_USERNAME}

    Delete User By Username    ${NEW_USERNAME}
    Assert User Absent         ${NEW_USERNAME}
