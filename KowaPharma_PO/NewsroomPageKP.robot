*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         ../Resources/Generic.robot

*** Variables ***
${linkNewsroom}              Newsroom
${contentLink_Newsroom}              xpath://*[@class='main-column']//a
@{listTextNewsroom}                 Newsroom
${buttonsAccordions}        xpath://*[@class='main-column']//button[not(@data-state='open')]


*** Keywords ***
Get All links in Newsroompage and Validate it
    click element   ${buttonMenu}
    wait until element passed is located on page and click element   xpath://div[@class='nav-item']//a[contains(.,'${linkNewsroom}')]
    Click each element from list   ${buttonsAccordions}
    Run Keyword And Continue On Failure     Get All links test     ${contentLink_Newsroom}
    Validate the headers    ${listTextNewsroom}
