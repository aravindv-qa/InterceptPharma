*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../ICPTMED_PO/LoginPageICPTMED.robot
Resource     ../ICPTMED_PO/MedicalInformationRequestPageICPTMED.robot
Resource     ../ICPTMED_PO/ProductPageICPTMED.robot
Resource     ../ICPTMED_PO/ResourcesPageICPTMED.robot
Resource     ../ICPTMED_PO/ContactUsPageICPTMED.robot
#Test Template   Fill the login Form country
#Library         DataDriver      file=test.csv     encoding=utf_8   dialect=unix
Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSPMED}
    maximize browser window
    LoginPageICPTMED.Assert the logos in homepage
    LoginPageICPTMED.Get All links in homepage and Validate it

ProductPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSPMED}
    maximize browser window
    ProductPageICPTMED.Get ProductsPage validated

ResourcesPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSPMED}
    maximize browser window
    ResourcesPageICPTMED.Get ResourcesPage validated

ContactUsPageTest
    [Tags]  Regression
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSPMED}
    maximize browser window
    ContactUsPageICPTMED.Get ContactUsePage validated
