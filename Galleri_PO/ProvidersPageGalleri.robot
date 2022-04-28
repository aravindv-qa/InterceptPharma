*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
@{eTextMain_list_hcp}       Patients   Providers   Employers   Health Systems   Early Detection   The Galleri Test    Clinical Evidence   Support
@{eTextDD_list_hcp}         Complementing Screening   MCED Resources   Using the\xa0Test   Order the\xa0Test   50+ Cancers Detected   FAQs
${e_color_value_hcp}        rgb(23, 177, 231)
${e_color_valueConstant_hcp}  rgba(23, 177, 231, 1)


*** Keywords ***
Get All links in ProvidersPage and Validate it
    Clickpage   Providers
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list_hcp}
    Run Keyword And Continue On Failure     Get All links test           ${mainNavDropdown}
    Validate Text from links     ${mainNavDropdown}  ${eTextDD_list_hcp}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}
    Validate Moseover highlights the link   ${mainNavHighlight}  ${css-attributeGlobal}  ${e_color_value_hcp}
    Validate Moseover highlights the link   ${footerColorLink}  ${css-attributeFooter}  ${e_color_valueConstant_hcp}
    ${aColorHighlighted}=   Get CSS Property Value        xpath://div[@id='header-navbar-collapse']//a[contains(text(),'Providers')]     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_value_hcp}

Get MenusInProvidersPage validated
    Clickpage   Providers
    Get MainPage validated   Early Detection
    Get SubPage validated   Early Detection   routine-screenings   ${e_color_valueConstant_hcp}
    Get SubPage validated   Early Detection   mced-resources   ${e_color_valueConstant_hcp}
    Get MainPage validated   The Galleri Test
    Get SubPage validated   The Galleri Test   using-the-test   ${e_color_valueConstant_hcp}
    Get SubPage validated   The Galleri Test   ordering   ${e_color_valueConstant_hcp}
    Get SubPage validated   The Galleri Test   types-of-cancer-detected   ${e_color_valueConstant_hcp}
    Get MainPage validated   Clinical Evidence
    Get MainPage validated   Support
    Get SubPage validated   Support   provider-faqs   ${e_color_valueConstant_hcp}


