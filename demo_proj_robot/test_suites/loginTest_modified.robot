*** Settings ***
Resource     ../page_objects/loginPage.resource
Library     ../python_lib/custom_keywords.py
Library    Collections

*** Variables ***
${url}     https://clever.com/oauth/sis/login?target=NTVmMjIwM2Y0NDMxNGEwMTAwMDA0OGUx%3BNGM2M2MxY2Y2MjNkY2U4MmNhYWM%3D%3BaHR0cHM6Ly9jbGV2ZXIuY29tL2luL2F1dGhfY2FsbGJhY2s%3D%3BNjY1ODJiN2RlYjIzNTU0NDYzOTQwYzc3MjRlMzZlY2VjOTZlOWEyNTU0MjkwMDk3ZDllNjZkMDIwNDMyMThmZQ%3D%3D%3BY29kZQ%3D%3D%3B&skip=1&default_badge= 
${browser}     chrome
${username}    skelly
${password}    clever

*** Test Cases ***
Login with admin user
    Open Browser                  url=${url}     browser=${browser}
    Set Browser Implicit Wait     10
    Input Text                    id=username    ${username}
    Input Password                id=password    ${password}
    Click Button                  id=UsernamePasswordForm--loginButton
    Page Should Contain Button    id=TopBarHomeroomButton
    Click Button                  id=TopBarClassesButton
        ${classes}=   Get WebElements    class:TeacherClasses--SectionCard--CourseName--Shortname
        FOR     ${element}    IN    @{classes}
                Log To Console      ${element}
        END
    Click Button                  id=Menu--trigger--1
    Click Element                 link=Log out
    Close Browser