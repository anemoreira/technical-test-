*** Variables ***

# MENU LATERAL
${ADMIN_MENU}    xpath=//aside//ul/li[1]/a[contains(@href,'admin')]

# MENU SUPERIOR ADMIN
${USER_MANAGEMENT_TAB}    xpath=//span[normalize-space()='User Management']
${USERS_MENU}             xpath=//a[normalize-space()='Users']

# BOTÕES
${ADD_BUTTON}      xpath=//button[normalize-space()='Add']
${SAVE_BUTTON}     xpath=//button[@type='submit']

# PESQUISA
${SEARCH_USERNAME_INPUT}    xpath=//label[text()='Username']/../following-sibling::div//input
${SEARCH_BUTTON}            xpath=//button[.//i[contains(@class,'bi-search')]]

# TABELA
${TABLE_CARD}    xpath=//div[contains(@class,'oxd-table-card')]
${TABLE_ROWS}    xpath=//div[contains(@class,'oxd-table-row')]

# FORMULÁRIO
${FORM_USERNAME_INPUT}            xpath=//label[normalize-space()='Username']/../following-sibling::div//input
${FORM_PASSWORD_INPUT}            xpath=//label[normalize-space()='Password']/../following-sibling::div//input
${FORM_CONFIRM_PASSWORD_INPUT}    xpath=//label[normalize-space()='Confirm Password']/../following-sibling::div//input
${FORM_EMPLOYEE_NAME_INPUT}       xpath=//input[@placeholder='Type for hints...']
${FORM_USER_ROLE_DROPDOWN}        xpath=(//div[contains(@class,'oxd-select-text')])[1]
${FORM_STATUS_DROPDOWN}           xpath=(//div[contains(@class,'oxd-select-text')])[2]

# DELETE
${CONFIRM_DELETE_BUTTON}    xpath=//button[normalize-space()='Yes, Delete']
