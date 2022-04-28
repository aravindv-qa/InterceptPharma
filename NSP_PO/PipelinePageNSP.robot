*** Settings ***
Documentation    Suite description
Resource         ../Resources/Generic.robot
*** Variables ***
#                               PIPELINE
${Pipeline}                     xpath://div[@class='main-nav']/a[.=' PIPELINE ']

*** Keywords ***
Get PipelinePage validated
    Wait Until element passed is located on Page and click link  ${Pipeline}
    Run Keyword And Continue On Failure     Get All links test           ${NSP_contentLink}
    ${aColorHighlighted}=   Get CSS Property Value        ${Pipeline}     ${css-attributeGlobal}
    Should Be Equal As Strings     ${aColorHighlighted}     ${eColorHighlightedGlobal}
