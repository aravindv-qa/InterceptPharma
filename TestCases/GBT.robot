*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../GBT_PO/LoginPageGBT.robot
Resource     ../GBT_PO/AboutPageGBT.robot
Resource     ../GBT_PO/OurCommitmentPageGBT.robot
Resource     ../GBT_PO/ResearchPageGBT.robot
Resource     ../GBT_PO/OurMedicinePageGBT.robot
Resource     ../GBT_PO/CareersPageGBT.robot
#Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    LoginPageGBT.Assert the logos in Landing Page
    LoginPageGBT.Get All links in homepage and Validate it

AboutPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    AboutPageGBT.Get AboutHomePage validated
    AboutPageGBT.Get AboutOurCompanyPage validated
    AboutPageGBT.Get AboutLeadershipPage validated
    AboutPageGBT.Get AboutBoardOfDirectorsPage validated
    AboutPageGBT.Get AboutContactUsPage validated

OurCommitmentPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    OurCommitmentPageGBT.Get OurCommitmentHomePage validated
    OurCommitmentPageGBT.Get OurCommitmentPAPage validated
    OurCommitmentPageGBT.Get OurCommitmentGBTSupportConferencePage validated
    OurCommitmentPageGBT.Get OurCommitmentCovid19InformationAndResourcesPage validated
    OurCommitmentPageGBT.Get OurCommitmentCorporateGivingPage validated
    OurCommitmentPageGBT.Get OurCommitmentTheGBTFoundationPage validated
    OurCommitmentPageGBT.Get OurCommitmentExpandedAccessPage validated

ResearchPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    ResearchPageGBT.Get ResearchHomePage validated
    ResearchPageGBT.Get ResearchSCDPage validated
    ResearchPageGBT.Get ResearchPipelinePage validated
    ResearchPageGBT.Get ResearchESRPage validated
    ResearchPageGBT.Get ResearchPartnershipsPage validated
    ResearchPageGBT.Get ResearchPublicationsPage validated

OurMedicinePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    OurMedicinePageGBT.Get OurMedicineHomePage validated

CareersPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGBTtest}
    maximize browser window
    CareersPageGBT.Get CareersHomePage validated
    CareersPageGBT.Get CareersJobsPage validated
