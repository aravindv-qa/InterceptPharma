*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${header logo}          css:div.menu-container>a>img
#${logo_nav}             xpath://nav//a/img[@class='logo']/..
${footer logo}          css:div.footer-logo>a>img
${mainNav}              css:div#header-navbar-collapse li:not(.mobile)>a
${mainNavDropdown}      xpath://div[@class='dropdown-menu']/a[not (.='Overview' )]
${mainNavHighlight}     xpath://div[contains(@class,'navbar-bottom')]//ul/li[not(contains(.,'Home'))][contains(@class,'nav-item ')]/a
${mainNavBG}            xpath://div[contains(@class,'navbar-bottom')]//ul/li[not(contains(@class,'nav-item '))]
#${tn~social/search}     css:nav.row.row-top-nav li>a:not(.social-icon):not(.search-icon)
${footerNav}            css:footer#site-footer li:not(.mobile)>a
${footerColorLink}      xpath://div[contains(@class,'footer-column-links')]//a[contains(@class,'accent-color-')]
${footerHover~link}     xpath://footer[@id='site-footer']//li[not(@class='mobile')]/a[not(contains(@class,'accent-color-'))]
${footerNav_social}     css:div.footer-social-icons a
${contentLink}          css:div#maincontent a
@{eTextMain_list}       Patients   Providers   Employers   Health Systems   Early Detection   The Galleri Test    Support   Get Started
@{eTextFoot_list}       Patients   Early Detection   The Galleri Test   Support   Providers   Early Detection   The Galleri Test   Clinical Evidence   Support   Employers   Health Systems   Billing Portal   Provider Portal   About Grail   Sitemap   Privacy   HIPAA Notice   Accessibility   Terms   Lab Info
@{eTextDD_list}         Request the\xa0Test   50+ Cancers Detected   Pricing   Understanding your results   FAQs   Billing   Share Your Experience
${topNavSearch}         css:div.navbar-items  i.fas.fa-search
${inputSearch}          css:div.navbar-items input[type='search']
${inputText}            how it works
${searchResult}         css:div.search-results>div
${eSize}                2
${e_color_value}        rgb(213, 79, 156)
${e_color_valueConstant}  rgba(213, 79, 156, 1)
${css-attributeFooter}  color
${css-attributeGlobal}  border-color
${css-attributeDD}   background-color
${e_color_valueFooter}  rgba(59, 89, 178, 1)
${e_color_valueSocial}  rgba(107, 132, 206, 1)

*** Keywords ***
Assert the logos in Landing
    Clickpage   Patients
#    Run Keyword And Continue On Failure     Get All links test           ${logo_nav}
    Assert the logos     ${header logo}
    Assert the logos     ${footer logo}

Get All links in homepage and Validate it
    Clickpage   Patients
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list}
    Run Keyword And Continue On Failure     Get All links test           ${footerNav}
    Validate Text from links     ${footerNav}  ${eTextFoot_list}
    Run Keyword And Continue On Failure     Get All links test           ${mainNavDropdown}
    Validate Text from links     ${mainNavDropdown}  ${eTextDD_list}
    Run Keyword And Continue On Failure     Get All links test           ${footerNav_social}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}
    Validate Moseover highlights the link   ${mainNavHighlight}  ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${footerColorLink}  ${css-attributeFooter}  ${e_color_valueConstant}
    Validate Moseover highlights the link   ${footerHover~link}  ${css-attributeFooter}  ${e_color_valueFooter}
    Validate Moseover highlights the link   ${footerNav_social}  ${css-attributeFooter}  ${e_color_valueSocial}
    ${aColorHighlighted}=   Get CSS Property Value        xpath://div[@id='header-navbar-collapse']//a[contains(text(),'Patients')]     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_value}

Get MenusInPatientsPage validated
    Clickpage   Patients
    Get MainPage validated   Early Detection
    Get MainPage validated   The Galleri Test
    Get SubPage validated   The Galleri Test   request-the-test   ${e_color_valueConstant}
    Get SubPage validated   The Galleri Test   types-of-cancer-detected   ${e_color_valueConstant}
    Get SubPage validated   The Galleri Test   cost   ${e_color_valueConstant}
    Get SubPage validated   The Galleri Test   understanding-your-results   ${e_color_valueConstant}
    Get MainPage validated   Support
    Get SubPage validated   Support   faqs   ${e_color_valueConstant}
    Get SubPage validated   Support   pay-your-bill   ${e_color_valueConstant}
    Get SubPage validated   Support   share-your-experience   ${e_color_valueConstant}

Get MainPage validated
    [Arguments]     ${Page}
    clickpage   ${Page}
    Run Keyword And Continue On Failure     Get All links test    ${contentLink}

Get SubPage validated
    [Arguments]     ${MainMenu}  ${Submenu}    ${e_color}
    mouse over and click link   ${MainMenu}   ${Submenu}
    Run Keyword And Continue On Failure     Get All links test    ${contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        xpath://a[contains(.,'${Mainmenu}')]/following-sibling::div/a[contains(@href ,'${Submenu}')]     ${css-attributeDD}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color}

Validate search icon
    Validate search with enter              ${topNavSearch}  ${inputSearch}  ${inputText}  ${searchResult}    ${eSize}

Clickpage
    [Arguments]     ${Page}
    wait until element passed is located on page and click element  xpath://div[@id='header-navbar-collapse']//a[contains(text(),'${Page}')]

mouse over and click link
    [Arguments]     ${Mainmenu}  ${Submenu}
    mouse over   xpath://div[@id='header-navbar-collapse']//a[contains(text(),'${Mainmenu}')]
    wait until element passed is located on page and click element  xpath://a[contains(.,'${Mainmenu}')]/following-sibling::div/a[contains(@href ,'${Submenu}')]