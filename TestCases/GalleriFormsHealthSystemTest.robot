*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../Galleri_PO/LoginPageGalleri.robot
Resource     ../Galleri_PO/FormsTestGalleri.robot
Test Template   FormsTestGalleri
Library         DataDriver      file=datas/GalleriHealthSystemsPageForm.csv     encoding=utf_8   dialect=unix

*** Test Cases ***
FormsTest
    [Tags]  Regression GalleriForms

*** Keywords ***
FormsTestGalleri
    [Arguments]    ${Page}  ${FirstName}  ${LastName}  ${HealthSystem}  ${Title}  ${Phone}  ${Email}  ${Zip}
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
    maximize browser window
    FormsTestGalleri.Get HealthSystemForm validated   ${Page}  ${FirstName}  ${LastName}  ${HealthSystem}  ${Title}  ${Phone}  ${Email}  ${Zip}