*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}                    chrome
${url}                        http://www.emag.ro
${GamingTab}                  css:body > div.main-container-outer > div.megamenu-container.megamenu-always-open > div > div.megamenu-list-container > ul > li:nth-child(6) > a
${GamingTabTitle}             css:#emg-body-overlay > div.main-container-inner > div.emg-container > div > div.page-header > h1
${PlaystationTab}             css:#emg-body-overlay > div.main-container-inner > div.emg-container > div > div.emg-clear.main-page-container > aside > ul > li:nth-child(2) > a
${PlaystationTabTitle}        css:#emg-body-overlay > div.main-container-inner > div.emg-container > div > div.page-header > h1
${ConsolePlaystationTab}      css:#emg-body-overlay > div.main-container-inner > div.emg-container > div > div.emg-clear.main-page-container > aside > ul:nth-child(2) > li:nth-child(2) > a


*** Keywords ***
Navigate to GamingTab
    Click Element    ${GamingTab}    

Navigate to PlaystationTab
    Wait Until Element Is Visible    ${GamingTabTitle}
    Click Element    ${PlaystationTab}

Navigate to ConsolePlaystationTab
    Wait Until Element Is Visible    ${PlaystationTabTitle}
    Click Element    ${ConsolePlaystationTab}


    
