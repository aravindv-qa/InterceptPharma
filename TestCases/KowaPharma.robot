*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../KowaPharma_PO/LoginPageKP.robot
Resource     ../KowaPharma_PO/CompanyPageKP.robot
Resource     ../KowaPharma_PO/ProductsPageKP.robot
Resource     ../KowaPharma_PO/OurPurposePageKP.robot
Resource     ../KowaPharma_PO/CareersPageKP.robot
Resource     ../KowaPharma_PO/NewsroomPageKP.robot
Resource     ../KowaPharma_PO/CompliancePageKP.robot
Resource     ../KowaPharma_PO/ContactUsPageKP.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    LoginPageKP.Assert the logos in Landing
    LoginPageKP.Get All links in homepage and Validate it

CompanyPageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    CompanyPageKP.Get All links in Companypage and Validate it

ProductsPageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    ProductsPageKP.Get All links in Productpage and Validate it

OurPurposePageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    OurPurposePageKP.Get All links in Productpage and Validate it

CareersPageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    CareersPageKP.Get All links in Careerspage and Validate it

NewsroomPageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    NewsroomPageKP.Get All links in Newsroompage and Validate it

CompliancePageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    CompliancePageKP.Get All links in Compliancepage and Validate it

ContactUsPageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    ContactUsPageKP.Get forms submission validated in ContactUsPage


