*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${linkCompliance}              Compliance and Distribution
${contentLink_Compliance}              css:.logos a,.last-row a,.main-column+a
${linkHighlight_Compliance}     css:.buttons-copy
@{listTextCompliance}                 Compliance & Distribution

*** Keywords ***
Get All links in Compliancepage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkCompliance}')]
    Run Keyword And Continue On Failure     Get All links test     ${contentLink_Compliance}
    Validate the headers    ${listTextCompliance}
    Validate Moseover highlights the link   ${linkHighlight_Compliance}  ${css-attributeGlobal}  ${e_color_value}
