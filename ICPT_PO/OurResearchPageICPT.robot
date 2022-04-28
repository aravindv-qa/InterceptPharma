*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                OurResearch
${OurResearch}                   xpath://ul[@id='menu-primary-menu']//a[.='Our Research']

${eBreadCrumbsOR}                Home > Our Research
${sideBarOR}                     xpath://aside//ul[@class='nav sidebar-menu']//a[.='Our Research']/../ul/li/a
@{eSidebarListOR}                FXR   Pipeline   Clinical Trials   Medical Information Request Form

#                                OurResearch ->FXR
${linkFXR}		                 xpath://aside//ul[@class='nav sidebar-menu']//a[.='FXR']
${eBreadCrumbsFXR}               Home > Our Research > FXR

#                                OurResearch ->Pipeline
${linkPipeline}		             xpath://aside//ul[@class='nav sidebar-menu']//a[.='Pipeline']
${eBreadCrumbsPipeline}          Home > Our Research > Pipeline
${sideBarPipeline}               xpath://aside//ul[@class='nav sidebar-menu']//a[.='Pipeline']/../ul/li/a
@{eSidebarListPipeline}          Expanded Access

#                                OurResearch ->Pipeline -> Expanded Access
${linkEA}		                 xpath://aside//ul[@class='nav sidebar-menu']//a[.='Expanded Access']
${eBreadCrumbsEA}                Home > Our Research > Pipeline > Expanded Access

#                                OurResearch ->Clinical Trials
${linkCT}		                 xpath://aside//ul[@class='nav sidebar-menu']//a[.='Clinical Trials']
${eBreadCrumbsCT}                Home > Our Research > Clinical Trials

#                                OurResearch ->Medical Information Request Form
${linkMIRS}		                 xpath://aside//ul[@class='nav sidebar-menu']//li[@class='btn-mirf']//a[.='Medical Information Request Form']
${eBreadCrumbsMIRS}              Home > Our Research > Medical Information Request Form

*** Keywords ***
Get OurResearchHomePage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsOR}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarOR}
    Validate Text from links     ${sideBarOR}   ${eSidebarListOR}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${OurResearch}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}

Get OurResearchFXRPage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Wait Until element passed is located on Page and click element  ${linkFXR}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsFXR}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurResearchPipelinePage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Wait Until element passed is located on Page and click element  ${linkPipeline}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsPipeline}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarPipeline}
    Validate Text from links     ${sideBarPipeline}  ${eSidebarListPipeline}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurResearchExtendedAccessPage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Wait Until element passed is located on Page and click element  ${linkPipeline}
    Wait Until element passed is located on Page and click element  ${linkEA}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsEA}

Get OurResearchClincalTrialsPage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Wait Until element passed is located on Page and click element  ${linkCT}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsCT}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get OurResearchMIRSPage validated
    Wait Until element passed is located on Page and click element  ${OurResearch}
    Wait Until element passed is located on Page and click element  ${linkMIRS}
#    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsNASH}
#    Run Keyword And Continue On Failure     Get All links test           ${sideBarNASH}
#    Validate Text from links     ${sideBarNASH}  ${eSidebarListNASH}
#    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

