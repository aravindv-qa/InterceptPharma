*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${header logo}          xpath://header//a[@id='logo']
${footer logo}          xpath://footer//a[@id='logo']
${mainNav}              xpath://ul[@id='menu-main-menu']/li[not(contains(@class,'show-on-mobile'))]/a
${topNav}               xpath://ul[@id='menu-utility-menu']/li[not (@class='show-on-mobile social twitter')]/a[contains(@href,'http')]
${topNavGlobal}         xpath://ul[@id='menu-utility-menu']/li[not (@class='show-on-mobile social twitter')]/a[not (contains(@href,'http'))]
#${tn~social/search}     css:nav.row.row-top-nav li>a:not(.social-icon):not(.search-icon)
${footerMainNav}        xpath://nav[@id='footer-nav']/ul/li[not(contains(@class,'show-on-mobile'))][not(contains(@class,'utility'))]/a
${footerNavAll}         xpath://nav[@id='footer-nav']/ul/li[not(contains(@class,'show-on-mobile'))][not(contains(@class,'utility'))]//a
${footerNav~main}        xpath://nav[@id='footer-nav']/ul/li[not(contains(@class,'show-on-mobile'))][not(contains(@class,'utility'))]//li[not(@class=' in-context-addition')]/a
${footerNavLegal}       xpath://nav[@id='legal-menu']/ul/li[not(contains(@class,'show-on-mobile'))]/a
${contentLinkGlobal}    xpath://main[@id='content']//div/a
@{eTextMain_list}       About   Our Commitment   Research   Our Medicine   Investors & Media   Careers
@{eTextFoot_list}       About   Our Commitment   Research   Our Medicine   Investors & Media
@{eTextFootLegal_list}  Privacy Policy   Online Tracking Opt-Out Guide   Terms of use   Community guidelines
${topNavLocation}       css:ul.show a
@{eListLocation}        Global   France   Germany   UK
${cookiesAccept}        CSS:a.cookie_action_close_header
${popupClose}           xpath://button[@id='entry_dialog_continue_btn']
${e_color_value}        rgba(0, 79, 157, 1)
${e_color_valueFooter}  rgba(0, 181, 223, 1)
${css-attributeGlobal}  color


*** Keywords ***
Assert the logos in Landing Page
    Wait Until element passed is located on Page and click element   ${popupClose}
    Wait Until element passed is located on Page and click element   ${cookiesAccept}
    Assert the logos     ${header logo}
    Assert the logos     ${footer logo}
Get All links in homepage and Validate it
    Validate Moseover highlights the link   ${mainNav}  ${css-attributeGlobal}  ${e_color_value}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Validate Moseover highlights the link   ${footerNav~main}   ${css-attributeGlobal}  ${e_color_valueFooter}
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list}
    Run Keyword And Continue On Failure     Get All links test           ${topNav}
    Wait Until element passed is located on Page and click element   ${topNavGlobal}
    Run Keyword And Continue On Failure     Get All links test         ${topNavLocation}
    Validate Text from links     ${topNavLocation}  ${eListLocation}
    Click outside the element
    Run Keyword And Continue On Failure     Get All links test           ${footerNavAll}
    Validate Text from links     ${footerMainNav}   ${eTextFoot_list}
    Run Keyword And Continue On Failure     Get All links test          ${footerNavLegal}
    Validate Text from links     ${footerNavLegal}  ${eTextFootLegal_list}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

