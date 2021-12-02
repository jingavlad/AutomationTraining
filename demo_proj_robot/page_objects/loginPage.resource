*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${usernameField}     id:Input_Username
${passwordField}     id:Input_Password
${submitButton}      css:.btn-submit

*** Keywords ***
Login with specified credentials
    [Arguments]  ${username}  ${password}
    input text  ${usernameField}    ${username}
    input text  ${passwordField}    ${password}
    click element   ${submitButton}
    
