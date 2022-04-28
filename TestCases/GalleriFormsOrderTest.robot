*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../Galleri_PO/LoginPageGalleri.robot
Resource     ../Galleri_PO/FormsTestGalleri.robot
Test Template   FormsTestGalleri
Library         DataDriver      file=datas/GalleriOrderTest.csv     encoding=utf_8   dialect=unix

*** Test Cases ***
FormsTest
    [Tags]  Regression GalleriForms

*** Keywords ***
FormsTestGalleri
    [Arguments]    ${Page}  ${FirstName}  ${LastName}  ${Email}  ${Radio}  ${Kits}  ${Credentials}  ${Npi}  ${Phone}  ${Delivery}  ${Fax}  ${Practise}  ${Institution}  ${Street}  ${City}  ${State}  ${Zip}  ${Primary}  ${AdditionalInfo}  ${Mailing}  ${Submit}
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlGalleri}
    maximize browser window
    FormsTestGalleri.Get OrderTheTestForm validated   ${Page}  ${FirstName}  ${LastName}  ${Email}  ${Radio}  ${Kits}  ${Credentials}  ${Npi}  ${Phone}  ${Delivery}  ${Fax}  ${Practise}  ${Institution}  ${Street}  ${City}  ${State}  ${Zip}  ${Primary}  ${AdditionalInfo}  ${Mailing}  ${Submit}