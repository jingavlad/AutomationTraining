*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${GamingTab}                  //span[text()='Gaming, Carti & Birotica']
${GamingTabTitle}             //h1[contains(.,'Gaming, Carti & Birotica')]
${PlaystationTab}             //a[contains(.,'Playstation')]
${PlaystationTabTitle}        //h1[contains(.,'Playstation')]
${ConsolePlaystationTab}      //a[contains(.,'Console Playstation')]


*** Keywords ***
Navigate to GamingTab
    Click Element    ${GamingTab}    

Navigate to PlaystationTab
    Wait Until Element Is Visible    ${GamingTabTitle}
    Click Element    ${PlaystationTab}

Navigate to ConsolePlaystationTab
    Wait Until Element Is Visible    ${PlaystationTabTitle}
    Click Element    ${ConsolePlaystationTab}


    
