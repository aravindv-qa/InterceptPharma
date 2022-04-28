*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
@{eTextMain_list_hs}       Patients   Providers   Employers   Health Systems   Contact Us

*** Keywords ***
Get All links in HealthSystemsPage and Validate it
    Clickpage   Health Systems
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list_hs}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}
    Validate Moseover highlights the link   ${footerColorLink}  ${css-attributeFooter}  ${e_color_valueConstant_employers}
    ${aColorHighlighted}=   Get CSS Property Value        xpath://div[@id='header-navbar-collapse']//a[contains(text(),'Health Systems')]     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_value_employers}


