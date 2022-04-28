*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               OurFocus
${ourFocus}                     xpath://ul[@id='menu-primary-menu']//a[.='Our Focus']
${breadCrumbsGlobal}            css:div.col>span
${eBreadCrumbsOF}               Home > Our Focus
${sideBarOF}                    xpath://aside//ul[@class='nav sidebar-menu']//a[.='Our Focus']/../ul/li/a
@{eSidebarListOF}               PBC    NASH    Patient Resources
${contentLinkGlobal}		    css:main.main a[href]
${css-attributeGlobal}          border-bottom
${eColorHighlightedGlobal}      2px solid rgb(136, 174, 179)

#                               OurFocus ->PBC
${linkPBC}		                xpath://aside//ul[@class='nav sidebar-menu']//a[.='PBC']
${eBreadCrumbsPBC}              Home > Our Focus > PBC
${sideBarPBC}                   xpath://aside//ul[@class='nav sidebar-menu']//a[.='PBC']/../ul/li/a
@{eSidebarListPBC}              Meet Ally	Racial Disparities in PBC

#                               OurFocus ->PBC ->Meet Ally
${linkMeetAlly}		            xpath://aside//ul[@class='nav sidebar-menu']//a[.='Meet Ally']
${eBreadCrumbsMA}               Home > Our Focus > PBC > Meet Ally

#                               OurFocus ->PBC ->RDIP
${linkRDIP}		                xpath://aside//ul[@class='nav sidebar-menu']//a[.='Racial Disparities in PBC']
${eBreadCrumbsRDIP}             Home > Our Focus > PBC > Racial Disparities in PBC

#                               OurFocus ->NASH
${linkNASH}		                xpath://aside//ul[@class='nav sidebar-menu']//a[.='NASH']
${eBreadCrumbsNASH}             Home > Our Focus > NASH
${sideBarNASH}                  xpath://aside//ul[@class='nav sidebar-menu']//a[.='NASH']/../ul/li/a
@{eSidebarListNASH}             Meet Beth

#                               OurFocus ->PBC ->Meet Beth
${linkMeetBeth}		            xpath://aside//ul[@class='nav sidebar-menu']//a[.='Meet Beth']
${eBreadCrumbsMB}               Home > Our Focus > NASH > Meet Beth

#                               OurFocus ->Patient Resource
${linkPR}		                xpath://aside//ul[@class='nav sidebar-menu']//a[.='Patient Resources']
${eBreadCrumbsPR}               Home > Our Focus > Patient Resources

*** Keywords ***
Get OurFocusHomePage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsOF} 
    Run Keyword And Continue On Failure     Get All links test           ${sideBarOF}
    Validate Text from links     ${sideBarOF}   ${eSidebarListOF}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${ourFocus}     ${css-attributeGlobal} 
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}

Get OurFocusPBCPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkPBC}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsPBC}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarPBC}
    Validate Text from links     ${sideBarPBC}  ${eSidebarListPBC}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurFocusMeetAllyPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkPBC}
    Wait Until element passed is located on Page and click element  ${linkMeetAlly}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsMA}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurFocusRDIPPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkPBC}
    Wait Until element passed is located on Page and click element  ${linkRDIP}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsRDIP}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurFocusNASHPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkNASH}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsNASH}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarNASH}
    Validate Text from links     ${sideBarNASH}  ${eSidebarListNASH}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurFocusMeetBethPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkNASH}
    Wait Until element passed is located on Page and click element  ${linkMeetBeth}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsMB}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurFocusPRPage validated
    Wait Until element passed is located on Page and click element  ${ourFocus}
    Wait Until element passed is located on Page and click element  ${linkPR}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsPR}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}