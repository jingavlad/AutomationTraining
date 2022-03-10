*** Settings ***
Resource     ../page_objects/EmagMainPage.resource
Resource     ../page_objects/EmagProductPage.resource
Library     ../python_lib/custom_keywords.py
Library    Collections
Library    SeleniumLibrary

*** Variables ***
${browser}                    chrome
${url}                        https://www.emag.ro
${acceptCookiesButton}        css:.js-accept

*** Test Cases ***
Open Web Site
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Wait Until Keyword Succeeds    5x    1s     Click Element    ${acceptCookiesButton}
    Navigate to GamingTab
    Navigate to PlaystationTab
    Navigate to ConsolePlaystationTab
#   Sort the products
    Select 'Cele mai noi' sort option from dropdownbutton
    ${ProductName}=  Save the name of the selected product
    Add to Cart first available product
    Go to Cart
    Verify Cart    ${ProductName}
    Close Browser

#moved browser & url from resource file to robot file
#added the Accept Cookies action
#modified the sorting of the products
#modified the verification of the added product in the cart by using variables