*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ConsoleHardwareSonyTitle}        css:#main-container > section.page-section.page-listing-v2 > div > div.clearfix.pad-btm-md > div.page-container > div.listing-panel.has-floating-listing-panel-footer > div.listing-panel-heading > div.listing-page-title.js-head-title > span.title-phrasing.title-phrasing-xl
${SortOption}                      css:#main-container > section.page-section.page-listing-v2 > div > div.clearfix.pad-btm-md > div.page-container > div.listing-panel.has-floating-listing-panel-footer > div.listing-panel-footer.js-head-sort-options > div > div:nth-child(2) > div.sort-control-btn-dropdown.hidden-xs > button > span.sort-control-btn-option.text-truncate
${SortCriteria}                    css:#main-container > section.page-section.page-listing-v2 > div > div.clearfix.pad-btm-md > div.page-container > div.listing-panel.has-floating-listing-panel-footer > div.listing-panel-footer.js-head-sort-options > div > div:nth-child(2) > div.sort-control-btn-dropdown.hidden-xs.active > div > ul
${Newest}                          css:#main-container > section.page-section.page-listing-v2 > div > div.clearfix.pad-btm-md > div.page-container > div.listing-panel.has-floating-listing-panel-footer > div.listing-panel-footer.js-head-sort-options > div > div:nth-child(2) > div.sort-control-btn-dropdown.hidden-xs.active > div > ul > li:nth-child(2)
${PS5plusGames}                    css:#card_grid > div:nth-child(1) > div > div > div.card-v2-content > div.card-v2-atc.mrg-top-xxs > a > i

*** Keywords ***
Sort the products
    Wait Until Element Is Visible    ${ConsoleHardwareSonyTitle}
    Click Element    ${SortOption}    
    Wait Until Element Is Visible    ${SortCriteria}
    Click Element    ${Newest}
    Wait Until Element Is Not Visible    ${SortCriteria}
    
Shop
    Click Element    ${PS5plusGames}
    