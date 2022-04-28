*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               OURTEAM
${OurTeam}                     xpath://div[@class='main-nav']/a[.=' OUR TEAM ']
${css-attributeGlobal}          color
${eColorHighlightedGlobal}      solid rgb(29,197,186)

*** Keywords ***
Get OurTeamPage validated
    Wait Until element passed is located on Page and click link  ${OurTeam}
    ${aColorHighlighted}=   Get CSS Property Value        ${OurTeam}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}