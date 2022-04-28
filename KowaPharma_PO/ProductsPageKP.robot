*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${buttonMenu}               css:g#menu
${linkProducts}              Products
${contentLink_Products}              css:.gray a,.first a,.last-row a
${linkHighlightProducts}    css:.gray a,.first a
@{listTextProducts}                 Products
${textHeaders}              xpath://h1[.='']

*** Keywords ***
Get All links in Productpage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkProducts}')]
    Run Keyword And Continue On Failure     Get All links test     ${contentLink_Products}
    Validate the headers    ${listTextProducts}
    Validate Moseover highlights the link   ${linkHighlightProducts}  ${css-attributeGlobal}  ${e_color_value}
