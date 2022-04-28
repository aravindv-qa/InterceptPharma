*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${NSP_header logo}          css:div.flex-nav-wrapper>div>a>img
${NSP_footer logo}          css:div.footer-wrapper>div.logo>a>img
${NSP_mainNav}              xpath://div[@class='main-nav']/a
${NSP_topNav Social}        css:div.nav-wrapper>div.social-links>a
#${NSP_tn~social/search}     css:nav.row.row-top-nav li>a:not(.social-icon):not(.search-icon) no needed
${NSP_footerNav1}           css:div.footer-nav a
${NSP_footerNav2}           css:p.privacy-policy a
${NSP_footerSocial}         css:div.logo+div.social-links a
${NSP_contentLink}          css:div.content-wrapper a[href]
@{NSP_eTextMain_list}       HOME   WHO WE ARE   OUR TEAM   PIPELINE   PARTNERSHIP   CONTACT US   CAREERS
@{NSP_eTextFoot1_list}      WHO WE ARE   OUR TEAM   PIPELINE   PARTNERSHIP   CONTACT US   CAREERS
@{NSP_eTextFoot2_list}      Privacy Policy   Terms of Use   Corporate Compliance
${css-attributeGlobal}       color
${css-attributeFill}         fill
${e_color_value}             rgba(29, 197, 186, 1)
${NSP_buttonCookieSetting}   css:button#onetrust-pc-btn-handler
${NSP_buttonRejectCookies}   css:button.ot-pc-refuse-all-handler
${NSP_buttonAcceptCookies}   css:button#onetrust-accept-btn-handler
${NSP_id}                    onetrust-accept-btn-handler
*** Keywords ***
Assert the logos in homepage
    Wait Until element passed is located on Page   ${NSP_buttonAcceptCookies}
    Wait Until element passed is located on Page and JSclick element  ${NSP_id}
    Validate Moseover highlights the link   ${NSP_mainNav}  ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${NSP_topNav Social}  ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${NSP_footerNav1}   ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${NSP_footerNav2}   ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${NSP_footerSocial}  ${css-attributeGlobal}  ${e_color_value}
    Assert the logos     ${NSP_header logo}
    Assert the logos     ${NSP_footer logo}

Get All links in homepage and Validate it
    Run Keyword And Continue On Failure     Get All links test           ${NSP_footerNav1}
    Validate Text from links     ${NSP_footerNav1}  ${NSP_eTextFoot1_list}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_mainNav}
    Validate Text from links     ${NSP_mainNav}  ${NSP_eTextMain_list}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_footerNav2}
    Validate Text from links     ${NSP_footerNav2}  ${NSP_eTextFoot2_list}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_topNav Social}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_footerSocial}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}

