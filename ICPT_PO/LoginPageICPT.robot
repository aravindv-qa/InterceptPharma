*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${header logo}          xpath://nav//a/img[@class='logo']
#${logo_nav}             xpath://nav//a/img[@class='logo']/..
${footer logo}          xpath://footer//a/img[@class='footer-logo']
${mainNav}              css:nav.row.row-primary-nav li.main-menu-item>a
${topNav~search}        css:nav.row.row-top-nav li>a:not(.search-icon)
${tn~social/search}     css:nav.row.row-top-nav li>a:not(.social-icon):not(.search-icon)
${footerNav}            css:ul#menu-footer-nav a
${footerNav_href}       css:ul#menu-footer-nav a[href]
${contentLink}          css:div.wrap.container a
@{eTextMain_list}       Our Focus   Our Research    Our Medicine    Our Story
@{eTextFoot_list}       Privacy Policy   Privacy Shield Policy   Corporate Compliance   Terms of Use   Contact Us   Cookie Preferences
@{eTextTop_list}        Clinical Trials   Investors & Media   Careers   Contact Us
${topNavSearch}         css:nav.row.row-top-nav li>a[class='search-icon']
${inputSearch}          css:input[type=search]
${buttonSearch}         css:input[type=submit]
${inputText}            LEADERSHIP
${searchResult}         css:table>tbody>tr
${eSize}                2
*** Keywords ***
Assert the logos in Landing
#    Run Keyword And Continue On Failure     Get All links test           ${logo_nav}
    Assert the logos     ${header logo}
    Assert the logos     ${footer logo}
Get All links in homepage and Validate it
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list}
    Run Keyword And Continue On Failure     Get All links test           ${footerNav_href}
    Validate Text from links     ${footerNav}  ${eTextFoot_list}
    Run Keyword And Continue On Failure     Get All links test           ${topNav~search}
    Validate Text from links     ${tn~social/search}  ${eTextTop_list}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}
Validate search icon
    Validate search              ${topNavSearch}  ${inputSearch}  ${inputText}  ${buttonSearch}  ${searchResult}    ${eSize}

