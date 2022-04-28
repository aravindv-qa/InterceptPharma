*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
@{eTextMain_list_employers}       Patients   Providers   Employers   Health Systems   Talk with Our\xa0Team
${e_color_value_employers}        rgb(88, 80, 141)
${e_color_valueConstant_employers}  rgba(88, 80, 141, 1)


*** Keywords ***
Get All links in EmployersPage and Validate it
    Clickpage   Employers
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list_hs}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}
    Validate Moseover highlights the link   ${footerColorLink}  ${css-attributeFooter}  ${e_color_valueConstant_employers}
    ${aColorHighlighted}=   Get CSS Property Value        xpath://div[@id='header-navbar-collapse']//a[contains(text(),'Employers')]     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_value_employers}


