*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                OurStory
${OurStory}                      xpath://ul[@id='menu-primary-menu']//a[.='Our Story']
${eBreadCrumbsOS}                Home > Our Story
${sideBarOS}                     xpath://aside//ul[@class='nav sidebar-menu']//a[.='Our Story']/../ul/li/a
@{eSidebarListOS}                Leadership   Board   Locations

#                                OurStory ->Leadership
${linkLeadership}		         xpath://aside//ul[@class='nav sidebar-menu']//a[.='Leadership']
${breadCrumbsIAM}                css:div.col>div>span
${eBreadCrumbsLeadership}        Home > Investors & Media > Corporate Governance > Leadership
${sideBarIAM}                    xpath://aside//ul[@class='nav sidebar-menu']//a[.='Investors & Media']/../ul/li/a
@{eSidebarListIAM}               Press Releases      Events & Presentations   Corporate Governance   Financial Information   Stock Information   Contact Us

#                                OurStory ->Board
${linkBoard}		             xpath://aside//ul[@class='nav sidebar-menu']//a[.='Board']
${eBreadCrumbsBoard}             Home > Investors & Media > Corporate Governance > Board of Directors

#                                OurStory ->Locations
${linkLocations}		         xpath://aside//ul[@class='nav sidebar-menu']//a[.='Locations']
${eBreadCrumbsLocations}         Home > Our Story > Locations
${sideBarLocations}              xpath://aside//ul[@class='nav sidebar-menu']//a[.='Locations']/../ul/li/a
@{eSidebarListLocations}         Corporate Offices (US and UK)   Austria   Canada   France   Germany   Ireland   Italy   Luxembourg   Portugal   Spain   Switzerland   United Kingdom

*** Keywords ***
Get OurStoryHomePage validated
    Wait Until element passed is located on Page and click element  ${OurStory}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsOS}
    Run Keyword And Continue On Failure     Run Keyword And Continue On Failure   Get All links test               ${sideBarOS}
    Validate Text from links     ${sideBarOS}   ${eSidebarListOS}
    Run Keyword And Continue On Failure     Run Keyword And Continue On Failure   Get All links test               ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${OurStory}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}

Get OurStoryLeadershipPage validated
    Wait Until element passed is located on Page and click element  ${OurStory}
    Wait Until element passed is located on Page and click element  ${linkLeadership}
    Validate the string          ${breadCrumbsIAM}    ${eBreadCrumbsLeadership}
    Run Keyword And Continue On Failure   Get All links test               ${sideBarIAM}
    Validate Text from links     ${sideBarIAM}   ${eSidebarListIAM}

Get OurStoryBoardOfDirectorsPage validated
    Wait Until element passed is located on Page and click element  ${OurStory}
    Wait Until element passed is located on Page and click element  ${linkBoard}
    Validate the string          ${breadCrumbsIAM}    ${eBreadCrumbsBoard}
    Run Keyword And Continue On Failure   Get All links test               ${contentLinkGlobal}

Get OurStoryLocationsPage validated
    Wait Until element passed is located on Page and click element  ${OurStory}
    Wait Until element passed is located on Page and click element  ${linkLocations}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsLocations}
    Run Keyword And Continue On Failure   Get All links test               ${sideBarLocations}
    Validate Text from links     ${sideBarLocations}   ${eSidebarListLocations}
    Run Keyword And Continue On Failure   Get All links test               ${contentLinkGlobal}

