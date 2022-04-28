*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Resource     ../Resources/Generic.robot
Suite Teardown   Close All Browsers
Test Template   Validate UnSuccesful Login


*** Variables ***
${redbus icon}  id:redBus  #css:.redbus-logo.home-redirect


*** Test Cases ***      browser              url
Test Chrome             Chrome              https://www.redbus.in/
Test Edge               Edge                https://www.redbus.in/


*** Keywords ***

Validate UnSuccesful Login
    [Arguments]    ${browser_name}    ${url}
    Generic.open the browser and navigate to the url    ${browser_name}    ${url}
    Wait Until element passed is located on Page and click element  ${redbus icon}






