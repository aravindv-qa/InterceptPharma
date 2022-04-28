*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../Galleri_PO/LoginPageGalleri.robot
Resource     ../Galleri_PO/ProvidersPageGalleri.robot
Resource     ../Galleri_PO/EmployersPageGalleri.robot
Resource     ../Galleri_PO/HealthSystemsPageGalleri.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
#HomePageTest
#    [Tags]  Regression  GalleriUI
#    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
#    maximize browser window
#    LoginPageGalleri.Assert the logos in Landing
#    LoginPageGalleri.Get All links in homepage and Validate it
#    LoginPageGalleri.Validate search icon
#    LoginPageGalleri.Get MenusInPatientsPage validated
#
#ProvidersPageTest
#    [Tags]  Regression  GalleriUI
#    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
#    maximize browser window
#    ProvidersPageGalleri.Get All links in ProvidersPage and Validate it
#    ProvidersPageGalleri.Get MenusInProvidersPage validated

#EmployersPageTest
#    [Tags]  Regression  GalleriUI
#    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
#    maximize browser window
#    EmployersPageGalleri.Get All links in EmployersPage and Validate it

HealthSystemsPageTest
    [Tags]  Regression  GalleriUI
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
    maximize browser window
    HealthSystemsPageGalleri.Get All links in HealthSystemsPage and Validate it

