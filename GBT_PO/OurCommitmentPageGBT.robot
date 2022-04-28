*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               OurCommitment
${linkOurCommitment}            xpath://ul[@id='menu-main-menu']//a[contains(.,'Our Commitment')]
${eBreadCrumbsOurCommitment}    OUR COMMITMENT
@{eSidebarListOurCommitment}    Patients & Advocacy   GBT’s Supported Conferences   COVID-19 Information and Resources   Corporate Giving   The GBT Foundation   Expanded Access   Environmental, Social and Governance
${linkOurCommitmentDD}          xpath://ul[@id='menu-main-menu']/li[not(contains(@class,'show-on-mobile'))]/a[.='Our Commitment']/following-sibling::ul//a

#                               OurCommitment ->Patients & Advocacy
${linkPA}		                xpath://aside[@class='contextual-nav']/ul//a[.='Patients & Advocacy']
${eBreadCrumbsPA}               PATIENTS & ADVOCACY

#                               OurCommitment ->GBT’s Supported Conferences
${linkSC}		                xpath://aside[@class='contextual-nav']/ul//a[.='GBT’s Supported Conferences']
${eBreadCrumbsSC}               GBT’S SUPPORTED CONFERENCES

#                               OurCommitment ->COVID-19 Information and Resources
${linkIR}		                xpath://aside[@class='contextual-nav']/ul//a[.='COVID-19 Information and Resources']
${eBreadCrumbsIR}               COVID-19 INFORMATION AND RESOURCES

#                               OurCommitment ->Corporate Giving
${linkCG}		                xpath://aside[@class='contextual-nav']/ul//a[.='Corporate Giving']
${eBreadCrumbsCG}               CORPORATE GIVING

#                               OurCommitment ->The GBT Foundation
${linkFoundation}		        xpath://aside[@class='contextual-nav']/ul//a[.='The GBT Foundation']
${eBreadCrumbsFoundation}       THE GBT FOUNDATION

#                               OurCommitment ->Expanded Access
${linkEA}		                xpath://aside[@class='contextual-nav']/ul//a[.='Expanded Access']
${eBreadCrumbsEA}               EXPANDED ACCESS
*** Keywords ***
Get OurCommitmentHomePage validated
    get mainpage validated   ${linkOurCommitment}  ${eBreadCrumbsOurCommitment}  ${eSidebarListOurCommitment}  ${linkOurCommitmentDD}

Get OurCommitmentPAPage validated
    get subpage validated   ${linkPA}  ${eBreadCrumbsPA}

Get OurCommitmentGBTSupportConferencePage validated
    get subpage validated   ${linkSC}  ${eBreadCrumbsSC}

Get OurCommitmentCovid19InformationAndResourcesPage validated
    get subpage validated   ${linkIR}  ${eBreadCrumbsIR}

Get OurCommitmentCorporateGivingPage validated
    get subpage validated   ${linkCG}  ${eBreadCrumbsCG}

Get OurCommitmentTheGBTFoundationPage validated
    get subpage validated   ${linkFoundation}  ${eBreadCrumbsFoundation}

Get OurCommitmentExpandedAccessPage validated
    get subpage validated   ${linkEA}  ${eBreadCrumbsEA}

