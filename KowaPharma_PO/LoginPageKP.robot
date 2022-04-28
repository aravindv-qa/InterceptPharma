*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${header logo}              css:header a.logo
#${logo_nav}                xpath://nav//a/img[@class='logo']/..
${footer logo}              css:footer a>img
${buttonMenu}               css:g#menu
${linkMainNav}              css:div.nav-item a
${linkTopNavHighlight}      css:div.inner>a:not(.logo):not(.linkedin)
${linkTopNav}               css:div.inner a
${footerNav}                css:footer a:not(.logo)
${contentLink}              css:div.last-row a
${e_color_value}            rgba(202, 0, 0, 1)
@{eTextTopNav_list}         CONTACT US
@{eTextMainNav_list}        Company   Products   Our Purpose and Commitment   Careers   Newsroom   Compliance and Distribution   Contact Us
@{eTextFooter_list}         CONTACT US   From Hartsfield-Jackson Int'l Airport (Atlanta, GA)   From Montgomery Regional Airport (Montgomery, AL)   334.288.1288   Terms of Use  Privacy Policy
${css-attributeGlobal}      color
${css-attributeBG}          background-color
${e_color_valueBG}          rgba(255, 255, 255, 1)
${e_color_valueMN}          rgba(74, 74, 74, 1)


*** Keywords ***
Assert the logos in Landing
    Assert the logos     ${header logo}
    Assert the logos     ${footer logo}

Get All links in homepage and Validate it
    Run Keyword And Continue On Failure     Get All links test          ${linkTopNav}
    Validate Text from links    ${linkTopNavHighlight}  ${eTextTopNav_list}
    click element   ${buttonMenu}
    Run Keyword And Continue On Failure     Get All links test           ${linkMainNav}
    Validate Text from links     ${linkMainNav}  ${eTextMainNav_list}
    Validate Moseover highlights the link   ${linkTopNavHighlight}  ${css-attributeGlobal}  ${e_color_value}
    Validate Moseover highlights the link   ${linkMainNav}  ${css-attributeGlobal}  ${e_color_valueMN}
    Validate Moseover highlights the link   ${buttonMenu}  ${css-attributeGlobal}  ${e_color_valueMN}
    click element   ${buttonMenu}
    Run Keyword And Continue On Failure     Get All links test     ${contentLink}
     Validate Moseover highlights the link   ${contentLink}  ${css-attributeBG}  ${e_color_valueBG}
    Run Keyword And Continue On Failure     Get All links test           ${footerNav}
    Validate Text from links     ${footerNav}  ${eTextFooter_list}
    Validate Moseover highlights the link   ${footerNav}  ${css-attributeGlobal}  ${e_color_value}
