*** Settings ***
Documentation       Suite description
Resource            ../Resources/Generic.robot

*** Variables ***
#                                   Keep in the know with the Galleri test (Patients and Providers page)
${inputEmailHome}       css:#signup-email
${buttonSubmit}         css:form>button[type=submit]
${inputFName}           css:.form-line input[name=firstName]
${inputLName}           css:.form-line input[name=lastName]
${inputEmail}           css:.form-line input[name=email]
${inputPhone}           css:.form-line input[name=phone]
${radioButton}          css:.form-line input[name=user-type]
${selectPreferredCOntact}    css:.form-line select[name=preferredContact]
${inputText_providers}    css:.form-line textarea
${formSubmitButton}     css:.form-line button
${elementThankYou}      css:div.thankYou-box h3
${message}              Thank You
${closeButton}          css:div.modal-content>.close
#                                   ContactUs ->Patient
${inputCUPatientsFName}          css:form[data-form-id=patient] input[name=firstName]
${inputCUPatientsLName}          css:form[data-form-id=patient] input[name=lastName]
${inputCUPatientsEmail}        css:form[data-form-id=patient] input[name=email]
${inputCUPatientsPhone}          css:form[data-form-id=patient] input[name=phone]
${selectCUPatientsReason}          css:form[data-form-id=patient] select[name=reason]
${inputCUPatientsZip}          css:form[data-form-id=patient] input[name=zip]
${inputCUPatientsAdditional}          css:form[data-form-id=patient] textarea[name=message]       
${checkBoxCUPatientsAgree}      css:form[data-form-id=patient] .checkbox-label
${buttonCUPatientsSubmit}        css:form[data-form-id=patient] button
${txtEmployerSubmitThankYou}   xpath://form[@data-form-id='employersLead']/parent::div/parent::div/following-sibling::div//h2
#                                   ContactUs ->Providers
${inputCUProviderFName}          css:form[data-form-id=hcp] input[name=firstName]
${inputCUProviderLName}          css:form[data-form-id=hcp] input[name=lastName]
${inputCUProviderEmail}        css:form[data-form-id=hcp] input[name=email]
${inputCUProviderCPhone}          css:form[data-form-id=hcp] input[name=phone]
${selectCUProviderReason}          css:form[data-form-id=hcp] select[name=reason]
${inputCUProviderInstiution}          css:form[data-form-id=hcp] input[name=institution]
${inputCUProviderCity}          css:form[data-form-id=hcp] input[name=city]
${selectCUProviderState}          css:form[data-form-id=hcp] select[name=state]
${inputCUProviderZip}         css:form[data-form-id=hcp] input[name=zip]
${inputCUProviderAdditional}          css:form[data-form-id=hcp] textarea[name=message]       
${checkBoxCUProviderAgree}      css:form[data-form-id=hcp] .checkbox-label
${buttonCUProviderSubmit}        css:form[data-form-id=hcp] button
${txtEmployerSubmitThankYou}   xpath://form[@data-form-id='employersLead']/parent::div/parent::div/following-sibling::div//h2
#                                   GalleriTest  (Providers page)
${linkGalleriTest}      xpath://a[.='The Galleri Test ']
${linkOrderTheTest}     xpath://a[.='The Galleri Test ']/following-sibling::div/a[contains(@href,'ordering')]
${selectKits}           css:label[for=order-kit-number-kits]+div .multiselect__select
${selectKitsd}           css:label[for=order-kit-number-kits]+div ul.multiselect__content
${selectKitCount}       css:label[for=order-kit-number-kits]+div span>span
${inputKITSFName}       css:#order-kit-first-name
${inputKITSLName}       css:#order-kit-last-name
${inputKITScredentials}  css:#order-kit-credentials
${inputKITnpi}          css:#order-kit-npi
${inputKITemail}        css:#order-kit-email
${inputKITPhone}        css:#order-kit-phone
${selectDelivery}       css:label[for=order-kit-report-delivery]+div .multiselect__select
${ddDelivery}          css:label[for=order-kit-report-delivery]+div span>span
${inputKITfax}          css:#order-kit-fax
${inputKITpractise}     css:#order-kit-practice
${inputKITinstitution}  css:#order-kit-institution
${inputKITstreet}       css:#order-kit-street
${inputKITCity}       css:#order-kit-city
${selectState}          css:label[for=order-kit-state]+div .multiselect__select
${ddState}              css:label[for=order-kit-state]+div span>span
${inputKITZip}          css:#order-kit-zip
${radioKITprimary}      css:#order-kit-primary
${inputKITadditionalinformation}    css:#order-kit-additional-information
${radioKITcontact}      css:#order-kit-follow-contact
${radioKITmailing}      css:#order-kit-follow-mailing
${buttonGTSubmit}         css:div.form-cta>button
#                               Employers
${inputEmployerFName}          css:form[data-form-id=employersLead] input[name=firstname]
${inputEmployerLName}          css:form[data-form-id=employersLead] input[name=lastname]
${inputEmployerEmail}        css:form[data-form-id=employersLead] input[name=email]
${inputEmployerCompany}          css:form[data-form-id=employersLead] input[name=employer]
${inputEmployerTitle}          css:form[data-form-id=employersLead] input[name=title]
${inputEmployerPhone}          css:form[data-form-id=employersLead] input[name=phone]
${selectEmployerEmployees}          css:form[data-form-id=employersLead] select[name=employees]
${selectEmployerState}            css:form[data-form-id=employersLead] select[name=state]
${checkBoxEmployerAgree}      css:form[data-form-id=employersLead] .checkbox-label
${buttonEmployerSubmit}        xpath://button[.='SPEAK WITH OUR TEAM']
${txtEmployerSubmitThankYou}   xpath://form[@data-form-id='employersLead']/parent::div/parent::div/following-sibling::div//h2

${inputEmployerSUFName}        css:form[data-form-id=employerSignup] input[name=firstName]
${inputEmployerSULName}        css:form[data-form-id=employerSignup] input[name=lastName]
${inputEmployerSUEmployer}     css:form[data-form-id=employerSignup] input[name=employer]
${inputEmployerSUFTitle}       css:form[data-form-id=employerSignup] input[name=title]
${inputEmployerSUEmail}        css:form[data-form-id=employerSignup] input[name=email]
${buttonEmployerSUSubmit}        xpath://button[contains(text(),' SIGN UP TODAY')]
${txtEmployerSUSubmitThankYou}   xpath://form[@data-form-id='employerSignup']/parent::div/parent::div/following-sibling::div//h2
#                               HealthSystems
${inputHSFName}          css:form[data-form-id=healthSystems] input[name=firstName]
${inputHSLName}          css:form[data-form-id=healthSystems] input[name=lastName]
${inputHSCompany}        css:form[data-form-id=healthSystems] input[name=healthSystem]
${inputHSTitle}          css:form[data-form-id=healthSystems] input[name=title]
${inputHSPhone}          css:form[data-form-id=healthSystems] input[name=phone]
${inputHSEmail}          css:form[data-form-id=healthSystems] input[name=email]
${inputHSZip}            css:form[data-form-id=healthSystems] input[name=zip]
${checkBoxHSSignUp}      css:form[data-form-id=healthSystems] .checkbox-label
${buttonHSSubmit}        css:form[data-form-id=healthSystems] button



*** Keywords ***
Get KnowInTheKnowForm validated
    [Arguments]     ${Page}  ${FirstName}  ${LastName}  ${Email}   ${Radio}
    Clickpage   ${Page}
    input text     ${inputEmailHome}  ${Email}
    click button   ${buttonSubmit}
    Wait Until element passed is located on Page and click element   ${inputFName}
    input text   ${inputFName}  ${FirstName}
    input text   ${inputLName}  ${LastName}
    Select radiobutton    ${radioButton}  ${Radio}
    click button    ${formSubmitButton}
    Wait Until element passed is located on Page    ${elementThankYou}
    element text should be     ${elementThankYou}   ${message}
    click button   ${closeButton}

Get ShareYourExperianceForm validated
    [Arguments]     ${MainPage}  ${SubPage}  ${SubNav}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${Contactmethod}  ${AdditionalMessage}
    clickpage   ${MainPage}
    mouse over and click link   ${SubPage}   ${SubNav}
    input text  ${inputFName}  ${FirstName}
    input text  ${inputLName}  ${LastName}
    input text  ${inputEmail}  ${Email}
    input text  ${inputPhone}  ${Phone}
    select from list by value   ${selectPreferredCOntact}  ${Contactmethod}
    input text   ${inputText_providers}  ${AdditionalMessage}
    click button    ${formSubmitButton}
    Wait Until element passed is located on Page    ${elementThankYou}
    element text should be     ${elementThankYou}   ${message}

Get ContactUsForm validated
    [Arguments]     ${MainPage}  ${SubPage}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${WhatContent}  ${Institution}  ${City}  ${State}  ${Zip}  ${Additionalmessage}
    Run Keyword If  "${MainPage}" == "Patients"   Get ContactUsFormPatientsPage validated   ${MainPage}  ${SubPage}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${WhatContent}  ${Zip}  ${Additionalmessage}
    Run Keyword If  "${MainPage}" == "Providers"   Get ContactUsFormProvidersPage validated   ${MainPage}  ${SubPage}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${WhatContent}  ${Institution}  ${City}  ${State}  ${Zip}  ${Additionalmessage}

Get ContactUsFormPatientsPage validated
    [Arguments]     ${MainPage}  ${SubPage}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${WhatContent}  ${Zip}  ${Additionalmessage}
    Clickpage   ${MainPage}
    Clickpage   ${SubPage}
    input text   ${inputCUPatientsFName}  ${FirstName}
    input text   ${inputCUPatientsLName}  ${LastName}
    input text   ${inputCUPatientsEmail}  ${Email}
    input text   ${inputCUPatientsPhone}  ${Phone}
    select from list by value   ${selectCUPatientsReason}  ${WhatContent}
    input text   ${inputCUPatientsZip}  ${Zip}
    input text   ${inputCUPatientsAdditional}  ${Additionalmessage}
    click element   ${checkBoxCUPatientsAgree}
    click button   ${buttonCUPatientsSubmit}
    Wait Until element passed is located on Page    ${elementThankYou}
    element text should be     ${elementThankYou}   Thank You

Get ContactUsFormProvidersPage validated
    [Arguments]     ${MainPage}  ${SubPage}  ${FirstName}  ${LastName}  ${Email}  ${Phone}  ${WhatContent}  ${Institution}  ${City}  ${State}  ${Zip}  ${Additionalmessage}
    Clickpage   ${MainPage}
    Clickpage   ${SubPage}
    input text   ${inputCUProviderFName}  ${FirstName}
    input text   ${inputCUProviderLName}  ${LastName}
    input text   ${inputCUProviderEmail}  ${Email}
    input text   ${inputCUProviderCPhone}   ${Phone}
    select from list by value   ${selectCUProviderReason}  ${WhatContent}
    input text   ${inputCUProviderInstiution}   ${Institution}
    input text   ${inputCUProviderCity}    ${City}
    select from list by value   ${selectCUProviderState}  ${State}
    input text   ${inputCUProviderZip}  ${Zip}
    input text   ${inputCUProviderAdditional}  ${Additionalmessage}
    click element   ${checkBoxCUProviderAgree}
    click button   ${buttonCUPatientsSubmit}
    Wait Until element passed is located on Page    ${elementThankYou}
    element text should be     ${elementThankYou}   Thank You

Get OrderTheTestForm validated
    [Arguments]     ${Page}  ${FirstName}  ${LastName}  ${Email}  ${Radio}  ${Kits}  ${Credentials}  ${Npi}  ${Phone}  ${Delivery}  ${Fax}  ${Practise}  ${Institution}  ${Street}  ${City}  ${State}  ${Zip}  ${Primary}  ${AdditionalInfo}  ${Mailing}  ${Submit}
    Clickpage   ${Page}
    mouse over  ${linkGalleriTest}
    click link  ${linkOrderTheTest}
    scroll element into view    ${selectKits}
    click element   ${selectKits}
    Select dropdown   ${selectKitCount}  ${Kits}
    input text   ${inputKITSFName}  ${FirstName}
    input text   ${inputKITSLName}  ${LastName}
    input text   ${inputKITScredentials}  ${Credentials}
    input text   ${inputKITnpi}  ${Npi}
    input text   ${inputKITemail}  ${Email}
    input text   ${inputKITPhone}  ${Phone}
    click element   ${selectdelivery}
#    Select dropdown   ${ddDelivery}  ${Delivery}
#    input text   ${inputKITfax}  ${Fax}
#    input text   ${inputKITpractise}  ${Practise}
#    input text   ${inputKITinstitution}  ${Institution}
#    input text   ${inputKITstreet}  ${Street}
#    input text   ${inputKITCity}  ${City}
#    click element   ${selectState}
#    Select dropdown   ${ddState}  ${State}
#    input text   ${inputKITZip}  ${Zip}
##    select radio button
##    input text   ${radioKITprimary}  ${Primary}
#    input text   ${inputKITadditionalinformation}  ${AdditionalInfo}
##    input text   ${radioKITcontact}
##    input text   ${radioKITmailing}  ${Mailing}
#    click button   ${buttonGTSubmit}
#    wait until page contains    " Success!"   timeout=10
##    wait until element contains  ${buttonGTSubmit}  " Success!"  timeout=10
#    element text should be   ${buttonGTSubmit}   " Success!"

Get EmployersPageForm validated
    [Arguments]     ${Page}  ${FirstName}  ${LastName}  ${Email}  ${Company}  ${Job}  ${Phone}  ${Employeers}  ${HeadQuarters}
    Clickpage   ${Page}
    input text   ${inputEmployerFName}   ${FirstName}
    input text   ${inputEmployerLName}   ${LastName}
    input text   ${inputEmployerEmail}   ${Email}
    input text   ${inputEmployerCompany}  ${Company}
    input text   ${inputEmployerTitle}  ${Job}
    input text   ${inputEmployerPhone}  ${Phone}
    select from list by value   ${selectEmployerEmployees}  ${Employeers}
    select from list by label   ${selectEmployerState}  ${HeadQuarters}
    click element   ${checkBoxEmployerAgree}
    click button    ${buttonEmployerSubmit}
    Wait Until element passed is located on Page    ${txtEmployerSubmitThankYou}
    element text should be     ${txtEmployerSubmitThankYou}   Thank you.
    input text   ${inputEmployerSUFName}  ${FirstName}
    input text   ${inputEmployerSULName}   ${LastName}
    input text   ${inputEmployerSUEmployer}  ${Company}
    input text   ${inputEmployerSUFTitle}  ${Job}
    input text   ${inputEmployerSUEmail}  ${Email}
    click button    ${buttonEmployerSUSubmit}
    Wait Until element passed is located on Page    ${txtEmployerSubmitThankYou}
    element text should be     ${txtEmployerSUSubmitThankYou}   Thank you for signing up to learn more about the Galleri test.

Get HealthSystemForm validated
    [Arguments]     ${Page}  ${FirstName}  ${LastName}  ${HealthSystem}  ${Title}  ${Phone}  ${Email}  ${Zip}
    Clickpage   ${Page}
    input text   ${inputHSFName}   ${FirstName}
    input text   ${inputHSLName}  ${LastName}
    input text   ${inputHSCompany}  ${HealthSystem}
    input text   ${inputHSTitle}  ${Title}
    input text   ${inputHSPhone}  ${Phone}
    input text   ${inputHSEmail}  ${Email}
    input text   ${inputHSZip}  ${Zip}
    click element   ${checkBoxHSSignUp}
    click button    ${buttonHSSubmit}

Select radiobutton
    [Arguments]     ${nav}  ${expectedValue}
    ${element_list}=     get webelements     ${nav}
     FOR  ${element}   IN   @{element_list}
      ${value}=   get element attribute  ${element}  value
      Run Keyword If    "${value}" == "${expectedValue}"   click element  ${element}
    END

Select dropdown
    [Arguments]     ${nav}  ${expectedValue}
    ${element_list}=     get webelements     ${nav}
     FOR  ${element}   IN   @{element_list}
      ${value}=  get text   ${element}
      log  ${value}
      Run Keyword If    "${value}" == "${expectedValue}"   click element  ${element}
    END

