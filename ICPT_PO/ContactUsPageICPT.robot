*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                Careers
${ContactUs}                     xpath://ul[@id='menu-top-menu']//a[.='Contact Us']
${breadCrumbsGlobal}             css:div.col>span
${eBreadCrumbsContactUs}         Home > Contact Us
${contentLinkGlobal}		     css:main.main a[href]

*** Keywords ***
Get ContactUsHomePage validated
    Wait Until element passed is located on Page and click element  ${ContactUs}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsContactUs}
    Run Keyword And Continue On Failure   Get All links test           ${contentLinkGlobal}
