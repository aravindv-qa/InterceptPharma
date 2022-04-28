*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               PARTNERSHIP
${Partnership}                  xpath://div[@class='main-nav']/a[.=' PARTNERSHIP ']

*** Keywords ***
Get PartnershipPage validated
    Wait Until element passed is located on Page and click link  ${Partnership}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        ${Partnership}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}
