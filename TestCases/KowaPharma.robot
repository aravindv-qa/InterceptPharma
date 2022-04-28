*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../KowaPharma_PO/LoginPageKP.robot

Suite Teardown   Close All Browsers

*** Test Cases ***
HomePageTest
    [Tags]  Regression  KowaPharma
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlKowaPharma}
    maximize browser window
    LoginPageKP.Assert the logos in Landing
    LoginPageKP.Get All links in homepage and Validate it



