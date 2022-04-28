*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${buttonMenu}               css:g#menu
${linkOurPurpose}              Our Purpose and Commitment
${contentLink_OurPurpose}              css:div.main-column a
@{listTextOurPurpose}          Our Purpose and Commitment

*** Keywords ***
Get All links in OurPurposepage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkOurPurpose}')]
    Run Keyword And Continue On Failure     Get All links test     ${contentLink_OurPurpose}
    Validate the headers    ${listTextOurPurpose}
