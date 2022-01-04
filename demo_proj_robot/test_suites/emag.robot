*** Settings ***
Resource     ../page_objects/EmagMainPage.resource
Resource     ../page_objects/EmagProductPage.resource
Library     ../python_lib/custom_keywords.py
Library    Collections
Library    SeleniumLibrary

*** Test Cases ***
Buy Item from Emag
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Navigate to GamingTab
    Navigate to PlaystationTab
    Navigate to ConsolePlaystationTab
    Sort the products
    Add to Cart first available product
    Go to Cart
    Verify Cart
    Close Browser