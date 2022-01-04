*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ConsoleHardwareSonyTitle}        //span[text()='Console Hardware Sony']
${SortOption}                      //span[text()='Cele mai populare']
${Newest}                          //a[contains(.,'Cele mai noi')]
${PS5plusGames}                    //*[@class="btn btn-sm btn-primary btn-emag btn-block yeahIWantThisProduct"]
${ProductAdded}                    //h4[contains(.,'Produsul a fost adaugat in cos')]
${CartTab}                         //a[contains(.,'Vezi detalii cos')]
${CartTabTitle}                    //h1[contains(.,'Cosul meu')]
${PS}                              //a[contains(.,'Consola PlayStation 5 (B-Chasis) + Joc PS5 Ratchet & Clank: Rift Apart + Joc Marvel’s Spider Man: Miles Morales PS5 + Joc Demon`s Soul Remake! PS5')]

*** Keywords ***
Sort the products
    Wait Until Element Is Visible    ${ConsoleHardwareSonyTitle}
    Click Element    ${SortOption}            
    Wait Until Element Is Visible    ${Newest}
    Click Element    ${Newest}
    Wait Until Element Is Not Visible    ${SortOption}
    
Add to Cart first available product
    Click Element    ${PS5plusGames}

Go to Cart
    Wait Until Element Is Visible    ${ProductAdded}
    Click Element    ${CartTab}

Verify Cart
    Wait Until Element Is Visible    ${CartTabTitle}
    Element Should Be Visible    ${PS}    