*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

*** Variables ***
#${ConsoleHardwareSonyTitle}        //span[text()='Console Hardware Sony']
#${SortOption}                      //span[text()='Cele mai populare']
#${Newest}                          //a[contains(.,'Cele mai noi')]

${dropdownbutton}                  xpath://*[text()='Ordoneaza dupa:']/parent::*/*[contains(@class,'btn-dropdown')]
${sortOptionTemplate}              xpath://*[@class='dropdown-menu']//*[text()='sort_option']

${AdaugaInCos}                     //*[@class="btn btn-sm btn-primary btn-emag btn-block yeahIWantThisProduct"]
${FirstPS5Product}                 css:.card-v2-title
#${ProductAdded}                    //h4[contains(.,'Produsul a fost adaugat in cos')]
${ProductAdded}                    //p[contains(.,'Produsul a fost adaugat in cos')]
${CartTab}                         //a[contains(.,'Vezi detalii cos')]
${CartTabTitle}                    //h1[contains(.,'Cosul meu')]
${ProductFromCart}                 css:.main-product-title
#${PS}                              //a[contains(.,'Consola PlayStation 5 (B-Chassis) + Joc PS5 Gran Turismo 7 + Joc PS5 Horizon Forbidden West + Joc PS5 Marvel’s Spider Man: Miles Morales + PSPlus 365 zile + PSCard 100 RON')]

*** Keywords ***
#Sort the products
 #   Wait Until Element Is Visible    ${ConsoleHardwareSonyTitle}
 #   Click Element    ${SortOption}            
 #   Wait Until Element Is Visible    ${Newest}
 #   Click Element    ${Newest}
 #   Wait Until Element Is Not Visible    ${SortOption}

Select '${sort_option:Cele mai populare|Cele mai noi|Pret crescator|Pret descrescator|Nr. review-uri|Discount %}' sort option from dropdownbutton  
    Wait Until Page Contains Element    ${dropdownbutton}  
    Click Element    ${dropdownbutton}
    ${placeHolder}=   Replace String    ${sortOptionTemplate}    sort_option    ${sort_option}  
    Click Element    ${placeHolder}   
    Sleep  3s

Save the name of the selected product 
    ${NameOfFirstItem}=  GetText  ${FirstPS5Product} 
    [Return]  ${NameOfFirstItem}

Add to Cart first available product
    Click Element    ${AdaugaInCos}

Go to Cart
    Wait Until Element Is Visible    ${ProductAdded}
    Click Element    ${CartTab}

Verify Cart
    [Arguments]  ${ProductName}
    Wait Until Element Is Visible    ${CartTabTitle}
#    Element Should Be Visible    ${PS}    
    ${NameOfProduct}=  GetText    ${ProductFromCart}
    [Return]  ${NameOfProduct}
    Should Be Equal    ${ProductName}    ${NameOfProduct}