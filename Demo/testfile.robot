*** Settings ***
Documentation    Suite description

*** Test Cases ***
Test title
    [Tags]    DEBUG
    #
#LoginTestEdge2
#    [Tags]  smoke
#    Generic.open the browser and navigate to the url    ${Browser2}   ${url}
#    maximize browser window
#
#    open browser        https://www.redbus.in/    chrome
#    maximize browser window
#    click link          id:redBus
#    click element       xpath://i[contains(@class,'icon-userprofile')]
#    log title
#    sleep               1
#    click element       xpath://span[.='Sign In/Sign Up']
#    sleep               1
#    switch window       title:Online Bus Tickets Booking: Book Bus Ticket and Bus Reservation -redBus India
#    log title
#    select frame        class:D121_iframe
#    click element       xpath://div[@class='customGPlusSignIn']
#    switch window       title:Sign in – Google accounts
#    input text          id:identifierId     aravind320420@gmail.com
#    log title
#    log                 india
#    close all browsers

#    sleep   1
#    input text  id:txtSource   sivagiri(erode)
#    sleep   1
#    click element   xpath://li[starts-with(@class,'C120_slist-item C120')]
#    input text  id:txtDestination   Sathyamangalam
#    sleep   1
#    click element   xpath://li[starts-with(@class,'C120_slist-item C120')]
#    input text    id:txtOnwardCalendar  12-Feb-2022
#    click button    xpath://*[contains(@class,'searchBuses')]
#    sleep    8
#    close all browsers


*** Keywords ***
Provided precondition
    Setup system under test