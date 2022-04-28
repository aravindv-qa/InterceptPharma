*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               Careers
${linkCareers}                 xpath://ul[@id='menu-main-menu']//a[contains(.,'Careers')]
${eBreadCrumbsCareers}         CAREERS
@{eSidebarListCareers}         Jobs
${linkCareersDD}               xpath://ul[@id='menu-main-menu']/li[not(contains(@class,'show-on-mobile'))]/a[.='Careers']/following-sibling::ul//a


#                               Careers ->Jobs
${linkJobs}		                xpath://aside[@class='contextual-nav']/ul//a[.='Jobs']
${eBreadCrumbsJobs}              JOBS

*** Keywords ***
Get CareersHomePage validated
    get mainpage validated   ${linkCareers}  ${eBreadCrumbsCareers}  ${eSidebarListCareers}  ${linkCareersDD}

Get CareersJobsPage validated
    get subpage validated   ${linkJobs}  ${eBreadCrumbsJobs}

