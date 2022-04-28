*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               Research
${linkResearch}                 xpath://ul[@id='menu-main-menu']//a[contains(.,'Research')]
${eBreadCrumbsResearch}         RESEARCH
@{eSidebarListResearch}         Sickle Cell Disease   Pipeline   Externally Sponsored Research (ESR)   Partnerships   Publications
${linkResearchDD}               xpath://ul[@id='menu-main-menu']/li[not(contains(@class,'show-on-mobile'))]/a[.='Research']/following-sibling::ul//a

#                               Research ->Sickle Cell Disease
${linkSCD}		                xpath://aside[@class='contextual-nav']/ul//a[.='Sickle Cell Disease']
${eBreadCrumbsSCD}              SICKLE CELL DISEASE

#                               Research ->Pipeline
${linkPipeline}		            xpath://aside[@class='contextual-nav']/ul//a[.='Pipeline']
${eBreadCrumbsPipeline}         PIPELINE

#                               Research ->Externally Sponsored Research (ESR)
${linkESR}		                xpath://aside[@class='contextual-nav']/ul//a[.='Externally Sponsored Research (ESR)']
${eBreadCrumbsESR}              EXTERNALLY SPONSORED RESEARCH (ESR)

#                               Research ->Partnerships
${linkPartnerships}		        xpath://aside[@class='contextual-nav']/ul//a[.='Partnerships']
${eBreadCrumbsPartnerships}     PARTNERSHIPS

#                               Research ->PUBLICATIONS
${linkPublications}		        xpath://aside[@class='contextual-nav']/ul//a[.='Publications']
${eBreadCrumbsPublications}     PUBLICATIONS
${linkRMMP}                     xpath://aside[@class='contextual-nav']/ul//a[.='Recent Medical Meeting Presentations']

*** Keywords ***
Get ResearchHomePage validated
    get mainpage validated   ${linkResearch}  ${eBreadCrumbsResearch}  ${eSidebarListResearch}  ${linkResearchDD}

Get ResearchSCDPage validated
    get subpage validated   ${linkSCD}  ${eBreadCrumbsSCD}

Get ResearchPipelinePage validated
    get subpage validated   ${linkPipeline}  ${eBreadCrumbsPipeline}

Get ResearchESRPage validated
    get subpage validated   ${linkESR}  ${eBreadCrumbsESR}

Get ResearchPartnershipsPage validated
    get subpage validated   ${linkPartnerships}  ${eBreadCrumbsPartnerships}

Get ResearchPublicationsPage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${linkPublications}
    Validate the string          ${breadCrumbsGlobal}     ${eBreadCrumbsPublications}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${linkRMMP}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

