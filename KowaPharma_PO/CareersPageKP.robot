*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${linkCareers}              Careers
${contentLink_Careers}              css:.corporate-listings a,.sales-rep-listings a,.dm a
@{listTextCareers}                 Careers   Current Opportunities   Our Tenets   Benefits   EEO/AA Statement

*** Keywords ***
Get All links in Careerspage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkCareers}')]
    Run Keyword And Continue On Failure     Get All links test     ${contentLink_Careers}
    Validate the headers    ${listTextCareers}
    Validate Moseover highlights the link   ${contentLink_Careers}  ${css-attributeGlobal}  ${e_color_value}
