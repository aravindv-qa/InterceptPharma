*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               WHOWEARE
${WhoWeAre}                     xpath://div[@class='main-nav']/a[.=' WHO WE ARE ']
${css-attributeGlobal}          color
${eColorHighlightedGlobal}      rgba(29, 197, 186, 1)

*** Keywords ***
Get WhoWeArePage validated
    Wait Until element passed is located on Page and click link  ${WhoWeAre}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        ${WhoWeAre}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}
