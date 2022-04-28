*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               PARTNERSHIP
${Contact Us}                  xpath://div[@class='main-nav']/a[.=' CONTACT US ']

*** Keywords ***
Get ContactUsPage validated
    Wait Until element passed is located on Page and click link  ${Contact Us}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        ${Contact Us}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}
