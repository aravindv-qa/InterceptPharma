*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../PO/ICPT_PO/LoginPageICPT.robot
Resource     ../PO/ICPT_PO/OurFocusPageICPT.robot
Resource     ../PO/ICPT_PO/OurResearchPageICPT.robot
Resource     ../PO/ICPT_PO/OurStoryPageICPT.robot
Resource     ../PO/ICPT_PO/CareersPageICPT.robot
Resource     ../PO/ICPT_PO/ContactUsPageICPT.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression  Homepage
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    LoginPageICPT.Assert the logos in homepage
    LoginPageICPT.Get All links in homepage and Validate it

OurFocusPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    OurFocusPageICPT.Get OurFocusHomePage validated
    OurFocusPageICPT.Get OurFocusPBCPage validated
    OurFocusPageICPT.Get OurFocusMeetAllyPage validated
    OurFocusPageICPT.Get OurFocusRDIPPage validated
    OurFocusPageICPT.Get OurFocusNASHPage validated
    OurFocusPageICPT.Get OurFocusMeetBethPage validated
    OurFocusPageICPT.Get OurFocusPRPage validated

OurResearchPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    OurResearchPageICPT.Get OurResearchHomePage validated
    OurResearchPageICPT.Get OurResearchFXRPage validated
    OurResearchPageICPT.Get OurResearchPipelinePage validated
    OurResearchPageICPT.Get OurResearchExtendedAccessPage validated
    OurResearchPageICPT.Get OurResearchClincalTrialsPage validated
    OurResearchPageICPT.Get OurResearchMIRSPage validated

OurStoryPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    OurStoryPageICPT.Get OurStoryHomePage validated
    OurStoryPageICPT.Get OurStoryLeadershipPage validated
    OurStoryPageICPT.Get OurStoryBoardOfDirectorsPage validated
    OurStoryPageICPT.Get OurStoryLocationsPage validated

CareersPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    CareersPageICPT.Get CareersHomePage validated
    CareersPageICPT.Get CareersJobPostingsPage validated
    CareersPageICPT.Get CareersCulturePage validated
    CareersPageICPT.Get CareersUSBenefitsPage validated

ContactUsPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlICPT}
    maximize browser window
    ContactUsPageICPT.Get ContactUsHomePage validated

# google
#RedbusTest
#    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlTest}
#    Get All links test      css:nav.product-nav.fl a

