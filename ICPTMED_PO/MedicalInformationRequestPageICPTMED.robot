*** Settings ***
Documentation       Suite description
Resource            ../Resources/Generic.robot

*** Variables ***
#                               MedicalInformationRequest
${linkMIR}                      xpath://a[.='Medical Information Request']
${textMIR}                      xpath://h2[.='MEDICAL INFORMATION REQUESTS']
${eText}                        MEDICAL INFORMATION REQUESTS
#${checkBoxPrivacyPolicy}        css:input[name='checkbox-disclaimer']
${selectCountry}                css:select[name='country']
${inputSalutation}              css:span input[name='salutation']
${inputFirstName}               css:span input[name='first-name']
${inputLastName}                css:span input[name='last-name']
${checkBoxDegree}               css:input[value='MD']
${checkBoxContactMethod}        css:input[value='Phone']
${inputPrimaryPhone}            css:span input[name='tel-number']
${inputEmailAdress}             css:span input[name='email-address' ]
${inputAddress1}                css:span input[name='text-address1']
${inputAddress2}                css:span input[name='text-address2']
${inputCity}                    css:span input[name='text-city']
${selectState}                  css:span select[name='state']
${inputZipcode}                 css:span input[name='text-zipcode']
${inputInquiry}                 css:span [name='textarea-inquiry']
${radioEnclose}                 xpath://input[starts-with(@value,'Please enclose')]
${checkBoxDigitalSignature}     css:span input[name='checkbox-signature[]']
${buttonSubmitForm}             css:input[value='Submit Request Form']
${textThankYouMessage}          xpath://div[@class='row wpcf7-form-succcess-msg']/p[1]
${thankYouMessage}              Thank you for submitting your medical inquiry. In the event that you have any questions regarding your inquiry, please contact us at medinfo@interceptpharma.com.
${fieldErrors}                  xpath://span[.='The field is required.']
${css-attributeGlobal}          color
${eColorHighlightedGlobal}      rgb(118     164     169)

*** Keywords ***
Get MIRFormsSubmissionPage validated
    Wait Until element passed is located on Page and click element   ${linkIamLicensed}
    Wait Until element passed is located on Page and click element  ${linkMIR}
    Validate the string          ${textMIR}    ${eText}
    select checkbox     ${chkboxPrivacyPolicy}

Fill the login Form
    [Arguments]     ${country}  ${salutation}  ${FirstName}  ${LastName}  ${Degree}  ${ContactMethod}  ${PrimaryPhone}    ${EmailAdress}    ${Address1}    ${Address2}    ${City}    ${State}    ${Zipcode}    ${Inquiry}    ${DigitalSignature}
#    [Arguments]     ${Country}  ${salutation}
    select from list by value   ${selectCountry}   ${country}
    input text      ${inputSalutation}   ${salutation}
    input text      ${inputFirstName}   ${FirstName}
    input text      ${inputLastName}   ${LastName}
#    select checkbox    ${checkBoxDegree}
    Select checkbox list   ${Degree}
    Select checkbox list   ${ContactMethod}
#    select checkbox    ${checkBoxContactMethod}
    input text      ${inputPrimaryPhone}   ${PrimaryPhone}
    input text      ${inputEmailAdress}   ${EmailAdress}
    input text      ${inputAddress1}   ${Address1}
    input text      ${inputAddress2}   ${Address2}
    input text      ${inputCity}   ${City}
    select from list by value   ${selectState}   ${State}
    input text      ${inputZipcode}   ${Zipcode}
    input text      ${inputInquiry}   ${Inquiry}
    click element       ${radioEnclose}
    select checkbox    ${checkBoxDigitalSignature}
    click button        ${buttonSubmitForm}
    Wait Until element passed is located on Page    ${textThankYouMessage}
    element text should be     ${textThankYouMessage}   ${thankYouMessage}

Select checkbox list
    [arguments]     ${values}
    @{value_list}=   split string  ${values}  ;
    FOR  ${value}   IN   @{value_list}
    select checkbox     css:input[value='${value}']
    END