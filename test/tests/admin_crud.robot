*** Settings ***
Library    Browser
Resource   ../env/dev.robot
Resource   ../resources/common/browser.robot
Resource   ../resources/pages/LoginPage.robot
Resource   ../resources/pages/AdminUsersPage.robot

Suite Setup       Open Browser To Base Url    ${BASE_URL}
Suite Teardown    Close Browser Session
Test Teardown     Run Keyword If    '${TEST STATUS}'=='FAIL'    Take Screenshot

*** Test Cases ***
CRUD Completo Usuário Admin
    ${rand}=    Generate Random String    6    [LOWER]
    ${USERNAME_NEW}=     Set Variable    rfuser_${rand}
    ${USERNAME_EDITED}=  Set Variable    rfuser_${rand}_edit

    Login With Credentials
    Open Admin Users

    Create User    Paul Collings    ${USERNAME_NEW}    Secret123!    ESS    Enabled
    Search User By Username    ${USERNAME_NEW}
    Assert User Present        ${USERNAME_NEW}

    Edit User Username         ${USERNAME_NEW}    ${USERNAME_EDITED}
    Search User By Username    ${USERNAME_EDITED}
    Assert User Present        ${USERNAME_EDITED}

    Delete User By Username    ${USERNAME_EDITED}
    Search User By Username    ${USERNAME_EDITED}
    Assert User Absent         ${USERNAME_EDITED}
