*** Settings ***
Library    Browser
Library    String
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/AdminUsersPage.robot

Suite Setup       Open Browser To Base Url
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Variables ***
${EMPLOYEE_NAME}      James Butler
${USER_ROLE}          Admin
${USER_STATUS}        Enabled
${USER_PASSWORD}      Secret123!

*** Test Cases ***
CRUD Completo Usuário Admin
    [Documentation]    Fluxo completo: Criar, buscar, editar e excluir usuário na aba Admin.
    [Tags]    regression    admin

    ${rand}=    Generate Random String    6    [LOWER]
    ${USERNAME_NEW}=      Set Variable    rfuser_${rand}
    ${USERNAME_EDITED}=   Set Variable    rfuser_${rand}_edit

    Login With Credentials
    Open Admin Users

    Create User    ${EMPLOYEE_NAME}    ${USERNAME_NEW}    ${USER_PASSWORD}    ${USER_ROLE}    ${USER_STATUS}
    Search User By Username    ${USERNAME_NEW}
    Assert User Present    ${USERNAME_NEW}

    Edit User Username    ${USERNAME_NEW}    ${USERNAME_EDITED}
    Search User By Username    ${USERNAME_EDITED}
    Assert User Present    ${USERNAME_EDITED}

    Delete User By Username    ${USERNAME_EDITED}
    Search User By Username    ${USERNAME_EDITED}
    Assert User Absent    ${USERNAME_EDITED}
