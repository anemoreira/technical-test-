*** Variables ***
${ADMIN_MENU}                     a[href="/web/index.php/admin/viewAdminModule"]
${USERS_MENU}                     a[href="/web/index.php/admin/viewSystemUsers"]
${ADD_BUTTON}                     button.oxd-button--secondary
${SAVE_BUTTON}                    button[type="submit"]
${SEARCH_USERNAME_INPUT}          xpath=//div[contains(@class,'oxd-input-group')]/div//input[@placeholder='Username']
${TABLE_CARD}                     .oxd-table-card
${TABLE_ROWS}                     .oxd-table-card
${FORM_USERNAME_INPUT}            xpath=//label[normalize-space(.)='Username']/../following-sibling::div//input
${FORM_PASSWORD_INPUT}            xpath=//label[normalize-space(.)='Password']/../following-sibling::div//input
${FORM_CONFIRM_PASSWORD_INPUT}    xpath=//label[normalize-space(.)='Confirm Password']/../following-sibling::div//input
${FORM_EMPLOYEE_NAME_INPUT}       xpath=//label[normalize-space(.)='Employee Name']/../following-sibling::div//input
${FORM_USER_ROLE_DROPDOWN}        xpath=//label[normalize-space(.)='User Role']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${FORM_STATUS_DROPDOWN}           xpath=//label[normalize-space(.)='Status']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
${CONFIRM_DELETE_BUTTON}          css:button.oxd-button--label-danger