*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           ../Resources/DriverSync.py
Library           Collections
Library           RequestsLibrary
Library           String
Library           Screenshot
#Library           DataDriver      C:/Users/aravind.v/PycharmProjects/pythonProject1/Resources/data.xlsx   sheet_name=data    encoding=UTF-8

*** Variables ***
# ${timeout}      timeout=10
${baseUrl}
*** Keywords ***
open the browser and navigate to the url
    [arguments]     ${browser_name}  ${url}
    Set selenium implicit wait    10
    Set Suite Variable    ${baseUrl}   ${url}
    ${driver_path}=   DriverSync.Get Driver Path    ${browser_name}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Run Keyword If    ${properties.headless}    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    executable_path=${driver_path}   chrome_options=${chrome_options}
    Set Window Size  1280  577
    Go To    ${url}

#    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome_options}   add_argument    headless
#    Call Method    ${chrome_options}   add_argument    disable-gpu
#    ${options}=     Call Method     ${chrome_options}    to_capabilities
#    Create Webdriver    Remote   command_executor=http://localhost:4444/wd/hub    desired_capabilities=${options}

#    Create Webdriver        ${browser_name}      executable_path=${driver_path}     desired_capabilities=${options}
#    Go To  ${url}
    Capture Page Screenshot     loginpage
open the browser with the url
#    set selenium timeout  ${properties.timeout}
    Create Webdriver    ${browser_name}  executable_path=resources/${browser_name}
    Go To   ${url}

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}   timeout=10
    Capture Page Screenshot     elementFound

Wait Until element passed is located on Page and click element
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}
    Wait Until Element Is Visible        ${page_locator}
    click element   ${page_locator}
    Capture Page Screenshot     elementFound

Wait Until element passed is located on Page and JSclick element
    [arguments]         ${page_locator}
#    Wait Until Element Is Visible        ${page_locator}
#    Wait Until Element Is Visible        ${page_locator}
#    ${Element}=   get webelement  ${page_locator}
#    Execute JavaScript  arguments[0].click(),${Element}
#    execute javascript   document.getElementByID("onetrust-accept-btn-handler")[0].onclick()
    Execute JavaScript    document.getElementById('${page_locator}').click()
    Capture Page Screenshot     elementFound

Click outside the element
    click element   xpath:/html

Wait Until element passed is located on Page and click link
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}
    click link   ${page_locator}
    Capture Page Screenshot    linkfound

Assert the logos
    [arguments]     ${logo}
#    page should contain element   ${logo}
    element should be visible   ${logo}
    ${beforetitle}=     get title
#    click image  ${logo}
    click element  ${logo}
    title should be  ${beforetitle}
    scroll element into view   ${logo}
    Capture Page Screenshot     logo

Get All links test
    [arguments]     ${nav}
    ${element_list}=     get webelements     ${nav}
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]
    Log    ${href_list}
    create session    testing    ${baseUrl}
     FOR    ${element_href}    IN    @{href_list}
        ${contains_linkedin}=    Evaluate     "linkedin" not in "${element_href}"
        ${contains_tel}=    Evaluate     "tel" not in "${element_href}"
        ${contains_mailto}=    Evaluate     "mailto" not in "${element_href}"
        ${response}=    Run Keyword If  ${contains_tel} == 'True' and ${contains_mailto} == 'True'    Get  ${element_href}
        Run Keyword If  ${contains_tel} == 'True' and ${contains_linkedin} == 'True' and ${contains_mailto} == 'True'   Should Be Equal As Strings     ${response.status_code}    200
    END

Validate Moseover highlights the link
    [arguments]     ${nav}  ${attribute name}  ${e_color_value}
    ${element_list}=     get webelements     ${nav}
    ${speed}=   get selenium speed
    set selenium speed  0.1
    FOR    ${element}   IN   @{element_list}
        scroll element into view   ${element}
        mouse over   ${element}
        ${name}=    Get Text    ${element}
        log   ${name}
        ${a_color_value}=   Get CSS Property Value     ${element}   ${attribute name}
        Should Be Equal As Strings     ${a_color_value}    ${e_color_value}
    END
    set selenium speed  ${speed}

Click each link from list 0f links
    [arguments]     ${nav}
    ${element_list}=     get webelements     ${nav}
    set selenium speed  0.1
    FOR    ${element}   IN   @{element_list}
        click link   ${element}
    END

Validate Text from links
    [arguments]     ${nav}  ${expectedText_list}
    ${element_list}=     get webelements     ${nav}
    ${actualText_list}=  Evaluate  [item.get_attribute('text').lstrip().rstrip() for item in $element_list]
    Log    ${actualText_list}
    Log    ${expectedText_list}
    Lists Should Be Equal    ${actualText_list}   ${expectedText_list}

Run keyword only if element is visible
    [arguments]     ${element}  ${keyword}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${element}
    Run Keyword If    ${present}    ${keyword}  ${element}

Validate search
    [arguments]     ${searchIcon}  ${searchArea}  ${input}  ${searchButton}  ${result}  ${eSize}
    Wait Until Element Is Visible        ${searchIcon}
    click link   ${searchIcon}
    input text   ${searchArea}   ${input}
    click button    ${searchButton}
    ${actaulSize}=    get element count  ${result}
    should be equal as integers     ${actaulSize}   ${eSize}

Validate search with enter
    [arguments]     ${searchIcon}  ${searchArea}  ${input}  ${result}  ${eSize}
    Wait Until Element Is Visible   ${searchIcon}
    click element   ${searchIcon}
    input text   ${searchArea}   ${input}
    Press Keys    ${searchArea}    ENTER
    ${actaulSize}=    get element count  ${result}
    should be equal as integers     ${actaulSize}   ${eSize}

Validate the string
    [Arguments]     ${elementLocator}   ${eResult}
    ${aResult}=   Get Text    ${elementLocator}
    log  ${aResult}
    log  ${eResult}
    Should Be Equal As Strings     ${aResult}     ${eResult}

Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    [Return]     ${prop_val}