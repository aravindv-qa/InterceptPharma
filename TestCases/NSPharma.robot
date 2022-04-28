*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../PO/NSP_PO/LoginPageNSP.robot
Resource     ../PO/NSP_PO/WhoWeArePageNSP.robot
Resource     ../PO/NSP_PO/OurTeamPageNSP.robot
Resource     ../PO/NSP_PO/PipelinePageNSP.robot
Resource     ../PO/NSP_PO/PartnershipPageNSP.robot
Resource     ../PO/NSP_PO/CareersPageNSP.robot
Resource     ../PO/NSP_PO/ContactUsPageNSP.robot
#Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    LoginPageNSP.Assert the logos in homepage
    LoginPageNSP.Get All links in homepage and Validate it

WhoWeArePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    WhoWeArePageNSP.Get WhoWeArePage validated

OurTeamPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    OurTeamPageNSP.Get OurTeamPage validated

PipelinePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    PipelinePageNSP.Get PipelinePage validated

PartnershipPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    PartnershipPageNSP.Get PartnershipPage validated

ContactUsPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    ContactUsPageNSP.Get ContactUsPage validated

CareersPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSP}
    maximize browser window
    CareersPageNSP.Get CareersPage validated
