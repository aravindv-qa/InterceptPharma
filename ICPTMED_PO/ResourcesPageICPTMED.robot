*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                 Resources
${linkResource}                   xpath://a[.='Resources']
${mainContent}                    css:main.main a

*** Keywords ***
Get ResourcesPage validated
    Wait Until element passed is located on Page and click element   ${linkIamLicensed}
    Wait Until element passed is located on Page and click element  ${linkResource}
    select checkbox     ${chkboxPrivacyPolicy}
    Run Keyword And Continue On Failure     Get All links test           ${mainContent}
