*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                                Products
${linkProduct}                   xpath://a[.='Product']
@{eCountriesList}                United States (US)   European Union (EU)   Canada   Israel   Switzerland   Australia   Liechtenstein   United Arab Emirates (UAE)
${linkCountries}		         css:div.product-countries>div>a
${linkCountriesWrapper}          css:div.product-countries>div>div a
${linkCountriesCollapsed}        css:div.product-countries>div>a[class='collapsed ']

*** Keywords ***
Get ProductsPage validated
    Wait Until element passed is located on Page and click element   ${linkIamLicensed}
    Wait Until element passed is located on Page and click element  ${linkProduct}
    select checkbox     ${chkboxPrivacyPolicy}
    Validate Text from links     ${linkCountries}   ${eCountriesList}
    Run Keyword And Continue On Failure   Click each link from list 0f links           ${linkCountriesCollapsed}
    Run Keyword And Continue On Failure   Get All links test           ${linkCountriesWrapper}
