*** Settings ***
Documentation    Cenários de tentativa de cadastro com senha muito curta

Resource    ../resources/base.resource

Test Template    Short password

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Não deve permitir o cadastro com senha de 1 dígito     1
Não deve permitir o cadastro com senha de 2 dígitos    12
Não deve permitir o cadastro com senha de 3 dígitos    123
Não deve permitir o cadastro com senha de 4 dígitos    1234
Não deve permitir o cadastro com senha de 5 dígitos    12345

*** Keywords ***
Short password
   [Arguments]    ${short_pass}
   
   ${user}         Create Dictionary    
   ...                 name=Paulo Estanqueiro
   ...                 email=estanqueiro@yahoo.com
   ...                 password=${short_pass}

   Go to signup page
   Submit signup form    ${user}

   Alert should be    Informe uma senha com pelo menos 6 digitos  
