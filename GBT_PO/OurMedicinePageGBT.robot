*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               Research
${linkOM}                       xpath://ul[@id='menu-main-menu']//a[contains(.,'Our Medicine')]
${eBreadCrumbsOM}         OUR MEDICINE


*** Keywords ***
Get OurMedicineHomePage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element  ${linkOM}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsOM}
