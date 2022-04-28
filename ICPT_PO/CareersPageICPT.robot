*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                Careers
${Careers}                       xpath://ul[@id='menu-top-menu']//a[.='Careers']
${breadCrumbsGlobal}             css:div.col>span
${eBreadCrumbsCareers}           Home > Careers
${sideBarCareers}                xpath://aside//ul[@class='nav sidebar-menu']//a[.='Careers']/../ul/li/a
@{eSidebarListCareers}           Job Postings   Culture   US Benefits
${contentLinkGlobal}		     css:main.main a[href]

#                                Careers ->JobPostings
${linkJP}		                 xpath://aside//ul[@class='nav sidebar-menu']//a[.='Job Postings']
${eBreadCrumbsJP}                Home > Careers > Job Postings

#                                Careers ->Culture
${linkCulture}		             xpath://aside//ul[@class='nav sidebar-menu']//a[.='Culture']
${eBreadCrumbsCulture}           Home > Careers > Culture

#                                Careers ->US Benefits
${linkUSB}		                 xpath://aside//ul[@class='nav sidebar-menu']//a[.='US Benefits']
${eBreadCrumbsUSB}               Home > Careers > Benefits

*** Keywords ***
Get CareersHomePage validated
    Wait Until element passed is located on Page and click element  ${Careers}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsCareers}
    Run Keyword And Continue On Failure   Get All links test           ${sideBarCareers}
    Validate Text from links     ${sideBarCareers}   ${eSidebarListCareers}
    Run Keyword And Continue On Failure   Get All links test           ${contentLinkGlobal}

Get CareersJobPostingsPage validated
    Wait Until element passed is located on Page and click element  ${Careers}
    Wait Until element passed is located on Page and click element  ${linkJP}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsJP}
    Run Keyword And Continue On Failure   Get All links test           ${contentLinkGlobal}

Get CareersCulturePage validated
    Wait Until element passed is located on Page and click element  ${Careers}
    Wait Until element passed is located on Page and click element  ${linkCulture}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsCulture}

Get CareersUSBenefitsPage validated
    Wait Until element passed is located on Page and click element  ${Careers}
    Wait Until element passed is located on Page and click element  ${linkUSB}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsUSB}

