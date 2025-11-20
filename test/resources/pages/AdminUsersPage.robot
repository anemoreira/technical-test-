*** Settings ***
Library    Browser
Resource   ../locators/admin_users.robot
Resource   ../common/util.robot

*** Keywords ***
Open Admin Users
    [Documentation]    Abre Admin > User Management > Users.
    Wait For And Click    ${ADMIN_MENU}
    Wait For Elements State    ${USERS_MENU}    visible
    Wait For And Click    ${USERS_MENU}
    Wait For Elements State    ${ADD_BUTTON}    visible

Create User
    [Arguments]    ${employee_name}    ${username}    ${password}    ${role}=ESS    ${status}=Enabled
    [Documentation]    Cria novo usuário preenchendo formulário e salvando.
    Wait For And Click    ${ADD_BUTTON}
    Select Dropdown Option    ${FORM_USER_ROLE_DROPDOWN}    ${role}
    Select Autocomplete Option    ${FORM_EMPLOYEE_NAME_INPUT}    ${employee_name}
    Select Dropdown Option    ${FORM_STATUS_DROPDOWN}    ${status}
    Input Text And Wait    ${FORM_USERNAME_INPUT}    ${username}
    Input Text And Wait    ${FORM_PASSWORD_INPUT}    ${password}
    Input Text And Wait    ${FORM_CONFIRM_PASSWORD_INPUT}    ${password}
    Wait For And Click    ${SAVE_BUTTON}

Search User By Username
    [Arguments]    ${username}
    [Documentation]    Pesquisa usuário pelo Username na lista.
    Input Text And Wait    ${SEARCH_USERNAME_INPUT}    ${username}
    Wait For And Click    ${SAVE_BUTTON}
    Wait For Elements State    ${TABLE_CARD}    visible

Assert User Present
    [Arguments]    ${username}
    [Documentation]    Valida presença do usuário na lista.
    ${row}=    Set Variable    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']
    Wait For Element Present    ${row}

Open Edit For Username
    [Arguments]    ${username}
    [Documentation]    Abre tela de edição para o usuário pelo Username.
    ${edit_btn}=    Set Variable    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']/ancestor::div[contains(@class,'oxd-table-card')]//button[1]
    Wait For And Click    ${edit_btn}

Edit User Username
    [Arguments]    ${current_username}    ${new_username}
    [Documentation]    Edita o Username do usuário.
    Open Edit For Username    ${current_username}
    Input Text And Wait    ${FORM_USERNAME_INPUT}    ${new_username}
    Wait For And Click    ${SAVE_BUTTON}

Delete User By Username
    [Arguments]    ${username}
    [Documentation]    Exclui usuário pelo Username com confirmação.
    ${del_btn}=    Set Variable    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']/ancestor::div[contains(@class,'oxd-table-card')]//button[contains(@class,'label-danger') or contains(@class,'--ghost')][last()]
    Wait For And Click    ${del_btn}
    Wait For And Click    ${CONFIRM_DELETE_BUTTON}

Assert User Absent
    [Arguments]    ${username}
    [Documentation]    Valida ausência do usuário na lista.
    ${row}=    Set Variable    xpath=//div[contains(@class,'oxd-table-card')]//div[normalize-space(.)='${username}']
    Wait For Element Absent    ${row}