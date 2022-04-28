*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                Careers
${ContactUs}                       xpath://a[.='Contact Us']
@{eCountriesList_contact}                  Austria   Canada   Cyprus   France   Germany   Greece   Ireland   Italy   Luxembourg   Malta   Portugal   Spain   Switzerland   United Kingdom   United States
${linkCountries_contact}		   css:div.contact-countries>div>a
${linkCountriesWrapper_contact}    css:div.contact-countries>div>div a
${linkCountriesCollapsed_contact}  css:div.contact-countries>div>a[class="collapsed"]

*** Keywords ***
Get ContactUsePage validated
    Wait Until element passed is located on Page and click element   ${linkIamLicensed}
    Wait Until element passed is located on Page and click element  ${ContactUs}
    select checkbox     ${chkboxPrivacyPolicy}
    Validate Text from links     ${linkCountries_contact}   ${eCountriesList_contact}
    Run Keyword And Continue On Failure   Click each link from list 0f links           ${linkCountriesCollapsed_contact}
    Run Keyword And Continue On Failure   Get All links test           ${linkCountriesWrapper_contact}
