*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${buttonMenu}               css:g#menu
${linkCompany}              Company
${contentLink}              css:div.last-row a
@{listTextCompany}          About Kowa Pharmaceuticals America, Inc.   Meet Our Management Team
${textHeaders}              xpath://h1[.='']

*** Keywords ***
Get All links in Companypage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkCompany}')]
    Run Keyword And Continue On Failure     Get All links test     ${contentLink}
    Validate the headers    ${listTextCompany}

Validate the headers
    [Arguments]   ${listText}
    FOR    ${text}   IN   @{listText}
        page should contain element   xpath://h1[contains(.,'${text}')]
    END