*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               CARRERS
${Careers}                      xpath://div[@class='main-nav']/a[.=' CAREERS ']

*** Keywords ***
Get CareersPage validated
    Wait Until element passed is located on Page and click link  ${Careers}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        ${Careers}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}
