*** Settings ***
Documentation    Ações e elementos do componente de mensagens de alerta

Library    Browser

*** Keywords ***
Alert should be
    [Arguments]    ${expected-text}
    
    Wait For Elements State    css=.alert-error >> text=${expected-text}    visible    5