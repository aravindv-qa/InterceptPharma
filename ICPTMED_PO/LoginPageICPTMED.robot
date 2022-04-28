*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${header logo}          css:a.brand>img
#${logo_nav}             xpath://nav//a/img[@class='logo']/..
${footer logo}          css:a.footer-logo>img
${mainNav}              xpath://ul[@class='nav primary-nav']//a[not(.='Home')]
${footerNav}            xpath://ul[@class='nav footer-nav']//a
${contentLink}          css:div.hero-content p:not(.d-block.d-sm-none)>a
@{eTextMain_list}       Medical Information Request   Product   Resources    Contact Us
@{eTextFoot_list}       Site Map   Privacy Policy   Privacy Shield Policy   ABOUT INTERCEPT   Contact Us
${chkboxPrivacyPolicy}  css:.cookie-disclaimer input[type='checkbox']
${linkIamLicensed}      xpath://a[contains(text(),'I AM A LICENSED')]
*** Keywords ***
Assert the logos in homepage
    Wait Until element passed is located on Page and click element   ${linkIamLicensed}
    Wait Until element passed is located on Page and click element   ${chkboxPrivacyPolicy}
    Assert the logos     ${header logo}
    Assert the logos     ${footer logo}
Get All links in homepage and Validate it
    Run Keyword And Continue On Failure     Get All links test           ${mainNav}
    Validate Text from links     ${mainNav}  ${eTextMain_list}
    Run Keyword And Continue On Failure     Get All links test           ${footerNav}
    Validate Text from links     ${footerNav}  ${eTextFoot_list}
    Run Keyword And Continue On Failure     Get All links test           ${contentLink}

