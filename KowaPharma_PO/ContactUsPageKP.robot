*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${linkContactUs}              Contact Us
${inputFname}         css:input[name=first_name]
${inputLname}         css:input[name=last_name]
${inputEmail}         css:input[name=email]
${inputPhone}         css:input[name=phone]
${radioContact}       xpath://label[.='Contact Type*:']/following-sibling::label/input
${selectConsumer}  css:select[name=consumer]
${selectProduct}      css:select[name=product]
${radioDepartment}    xpath://label[.='Department*:']/following-sibling::label/input
${inputText}          css:textarea[name=comments]
${buttonSubmit}          css:button>div.buttons-copy
${textMessage}          css:.contact-form>p
${message}          Form submitted successfully.

*** Keywords ***
Get forms submission validated in ContactUsPage
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkContactUs}')]
    input text   ${inputFname}  TestFN
    input text   ${inputLname}  TestLN
    input text   ${inputEmail}  TestFN@gmail.com
    input text   ${inputPhone}  7373252303
    Select radiobutton   ${radioContact}  Consumer
    wait until element is visible   ${selectConsumer}
    select from list by value   ${selectConsumer}  Patient
    Select radiobutton  ${radioDepartment}   Adverse Event-Product Reaction
    wait until element is visible   ${selectProduct}
    select from list by value   ${selectProduct}    Other
    input text   ${inputText}   Additional Text forms
    click element    ${buttonSubmit}
    wait until element is visible   ${textMessage}
    ${aText}=   get text   ${textMessage}
    Should Be Equal As Strings    ${aText}     ${message}

Select radiobutton
    [Arguments]     ${nav}  ${expectedValue}
    ${element_list}=     get webelements     ${nav}
     FOR  ${element}   IN   @{element_list}
      ${value}=   get element attribute  ${element}  value
      Run Keyword If    "${value}" == "${expectedValue}"   click element  ${element}
    END