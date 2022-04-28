*** Settings ***
Library  SeleniumLibrary
Variables    ../properties.py
Resource     ../Resources/Generic.robot
Resource     ../ICPTMED_PO/MedicalInformationRequestPageICPTMED.robot
Resource     ../ICPTMED_PO/LoginPageICPTMED.robot
Test Template   Fill the login Form country
Library         DataDriver      file=datas/test.csv     encoding=utf_8   dialect=unix
#Library         datadriver      Data.xlsx    sheet_name=Data
#Suite Teardown   Close All Browsers

*** Test Cases ***
MIRFormSubmissionTest ${country}

*** Keywords ***
Fill the login Form country
    [Arguments]     ${country}  ${salutation}  ${FirstName}  ${LastName}  ${Degree}  ${ContactMethod}  ${PrimaryPhone}    ${EmailAdress}    ${Address1}    ${Address2}    ${City}    ${State}    ${Zipcode}    ${Inquiry}    ${DigitalSignature}
#    [Arguments]     ${country}  ${salutation}
    Generic.open the browser and navigate to the url    ${properties.Browser1}    ${properties.urlNSPMED}
    maximize browser window
    MedicalInformationRequestPageICPTMED.Get MIRFormsSubmissionPage validated
#    select from list by value   ${selectCountry}   ${country}
    Fill the login Form   ${country}  ${salutation}  ${FirstName}  ${LastName}  ${Degree}  ${ContactMethod}  ${PrimaryPhone}    ${EmailAdress}    ${Address1}    ${Address2}    ${City}    ${State}    ${Zipcode}    ${Inquiry}    ${DigitalSignature}
#    Fill the login Form   ${country}  ${salutation}