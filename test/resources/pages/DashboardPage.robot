*** Settings ***
Library    Browser
Resource   ../locators/dashboard.robot
Resource   ../common/util.robot

*** Keywords ***
Assert Dashboard Visible
    [Documentation]    Valida breadcrumb do Dashboard visível.
    Wait For Elements State    ${DASHBOARD_BREADCRUMB}    visible