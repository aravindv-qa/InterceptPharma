*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               About
${linkAbout}                    xpath://ul[@id='menu-main-menu']//a[contains(.,'About')]
${breadCrumbsGlobal}            css:div.gbt-row-inner>h1
${eBreadCrumbsAbout}            ABOUT
${sideBarGlobal}                css:aside.contextual-nav>ul>li>a
@{eSidebarListAbout}            Our Company   Leadership   Board of Directors   Contact Us
${linkAboutDD}                  xpath://ul[@id='menu-main-menu']/li[not(contains(@class,'show-on-mobile'))]/a[.='About']/following-sibling::ul//a


#                               About ->Our Company
${linkOC}		                xpath://aside[@class='contextual-nav']/ul//a[.='Our Company']
${eBreadCrumbsOC}               OUR COMPANY
${css-attributeUnderline}       border-bottom
${e_color_valueUnderline}       2px solid rgb(255, 255, 255)

#                               About ->Leadership
${linkLeadership}	            xpath://aside[@class='contextual-nav']/ul//a[.='Leadership']
${eBreadCrumbsLeadership}       LEADERSHIP

#                               About ->Board of Directors
${linkBOD}		                xpath://aside[@class='contextual-nav']/ul//a[.='Board of Directors']
${eBreadCrumbsBOD}              BOARD OF DIRECTORS

#                               About ->Contact Us
${linkContactUs}	            xpath://aside[@class='contextual-nav']/ul//a[.='Contact Us']
${eBreadCrumbsContact}          Contact Us

*** Keywords ***
Get AboutHomePage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element  ${linkAbout}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsAbout}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarGlobal}
    Validate Text from links     ${sideBarGlobal}   ${eSidebarListAbout}
    Run Keyword And Continue On Failure     Get All links test           ${linkAboutDD}
    Validate Text from links     ${linkAboutDD}   ${eSidebarListAbout}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

#    ${aColorHighlighted}=   Get CSS Property Value        ${linkAbout}     ${css-attributeBG}
#    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

Get AboutOurCompanyPage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${linkOC}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsOC}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${linkOC}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

Get AboutLeadershipPage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${linkLeadership}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsLeadership}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${linkLeadership}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

Get AboutBoardOfDirectorsPage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${linkBOD}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbsBOD}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${linkBOD}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

Get AboutContactUsPage validated
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${linkContactUs}
    Validate the string          ${linkContactUs}    ${eBreadCrumbsContact}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${linkContactUs}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}

Get MainPage validated
    [arguments]     ${link}  ${eBreadCrumbs}  ${eSidebarList}   ${linkDD}
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element  ${link}
    Validate the string          ${breadCrumbsGlobal}    ${eBreadCrumbs}
    Run Keyword And Continue On Failure     Get All links test           ${sideBarGlobal}
    Validate Text from links     ${sideBarGlobal}   ${eSidebarList}
    Run Keyword And Continue On Failure     Get All links test           ${linkDD}
    Validate Text from links     ${linkDD}   ${eSidebarList}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}

Get SubPage validated
    [arguments]     ${link}  ${eBreadCrumbs}
    Run keyword only if element is visible   ${popupClose}  Wait Until element passed is located on Page and click element
    Run keyword only if element is visible   ${cookiesAccept}  Wait Until element passed is located on Page and click element
    Wait Until element passed is located on Page and click element   ${link}
    Validate the string          ${breadCrumbsGlobal}     ${eBreadCrumbs}
    Run Keyword And Continue On Failure     Get All links test           ${contentLinkGlobal}
    ${aColorHighlighted}=   Get CSS Property Value        ${link}     ${css-attributeUnderline}
    Should Be Equal As Strings     ${aColorHighlighted}     ${e_color_valueUnderline}