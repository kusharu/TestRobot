*** Settings ***
Documentation    To work with field, button, radio button, checkbox, drop down
Library    SeleniumLibrary

*** Variables ***
# Variable for URL
${URL}    https://register.rediff.com/register/register.php?FormName=user_details
# Disable Browser based notification
${options}    --disable-notifications

*** Test Cases ***
TC_001 work with different elements in Rediffmail create account page
    [Documentation]    Working with Rediffmail Ceate Account Page
    [Setup]    Open browser and navigate to Rediffmail Application Create Account page
    [Teardown]    run keyword if test failed    capture page screenshot     Failed_Screen_Create_Account_{index}.png
    Get and set the default page load out time
    Get and set the default speed of Selenium
    Set the Implicit wait time period
    Wait for the text to be present Create a Rediffmail account
    Validation on Landing Page title
    Validate the Full Name text inside HTML script of Full Name field
    Type on Full Name Field
    Take Stepwise Screenshot    FullNameTyped
    Validate the Choose a Rediffmail ID text of Choose a Rediffmail ID field
    Type on Choose a Rediffmail ID Field
    Take Stepwise Screenshot    RediffmailIDTyped
    Validate that class attribute btn_checkavail is present inside HTML script of Check Availability button
    Click on Check Availability button
    Take Stepwise Screenshot    CheckAvaibilityButtonClicked
    Wait that the page contain the text Yippie! The ID you've chosen is available
    Validate the Password text or attribute present inside HTML script of Password Field
    Type on Password Field
    Take Stepwise Screenshot    PasswordFieldTyped
    Validate the retype Password text in Retype Password Field
    Type on Retype Password Field
    Take Stepwise Screenshot    RePasswordFieldTyped
    Validate that text Click if you don't have an alternate ID is present
    Validate that checkbox is not selected
    Click on the checkbox Click if you don't have an alternate ID
    Take Stepwise Screenshot    AlternateIDCheckboxSelected
    Validate the text Select a Security Question
    Choose the option of What is your favourite pass-time from drop down
    Take Stepwise Screenshot    PassTimeOptionChosen
    Validate the text Enter an Answer
    Type the security answer
    Take Stepwise Screenshot    SecurityAnswerTyped
    Validate the text Mother's Maiden Name
    Type on Mother's Maiden Name field
    Take Stepwise Screenshot    MotherNameTyped
    Validate that text Mobile Number is present
    Choose USA option from Drop down
    Take Stepwise Screenshot    USAChosenDropDown
    Type on the Mobile No. field
    Take Stepwise Screenshot    MobileNumberTyped
    Validate that the text Date of Birth is present
    Choose third day option from Day Drop down
    Take Stepwise Screenshot    ThirdDayDropDown
#    select from list by label    xpath://select[contains(@name, 'DOB_Day')]     03
    Choose April Month option from Month Drop down
    Take Stepwise Screenshot    AprilMonthDropDown
    Choose 2020 Year option from Year Drop down
    Take Stepwise Screenshot    2020YearDropDown
#    Validate that attribute value f is presemt for female radio button value attribute
    Choose the female radio button
    Take Stepwise Screenshot    FemaleRadioButtonChosen
    Validate that the text Country is present
    Choose Austria option from Country Drop down
    Take Stepwise Screenshot    AustriaChosenDropDown
    Close Browser Window






*** Keywords ***
Open browser and navigate to Rediffmail Application Create Account page
   open browser    ${URL}   chrome
   maximize browser window


Get and set the default page load out time
    set selenium page load timeout    30 Seconds
    ${set_page_Load_Timeout}=    get selenium page load timeout
    log to console    ${set_page_Load_Timeout}

Set the Implicit wait time period
    set selenium implicit wait      20 seconds

Get and set the default speed of Selenium
    ${def_Sel_Speed}=    get selenium speed
    log to console    ${def_Sel_Speed}


Wait for the text to be present Create a Rediffmail account
    # We are using EMPLICIT WAIT which is also dynamic wait
    # Explicit wait is for a specific element based on certain condition which needs to be achived in the maximum time period
    wait until page contains    Create a Rediffmail account     10 seconds

Validation on Landing Page title
    # Message should be thrown out if title validation fails
    title should be    Rediffmail Free Unlimited Storage    Landing Page title is not found


Validate the Full Name text inside HTML script of Full Name field
    table column should contain    xpath://*[@id='tblcrtac']/tbody/tr[3]/td[1]      1       Full Name

Type on Full Name Field
    input text      xpath://input[contains(@name, 'name')]    Kaushik Mukherjee

Validate the Choose a Rediffmail ID text of Choose a Rediffmail ID field
    element text should be    xpath://td[text()='Choose a Rediffmail ID']     Choose a Rediffmail ID      Choose a Rediffmail ID text is not found


Type on Choose a Rediffmail ID Field
    input text    //input[starts-with(@name, 'login')]      testrobotframework

Validate that class attribute btn_checkavail is present inside HTML script of Check Availability button
    element attribute value should be    class:btn_checkavail       class   btn_checkavail      class attribute value btn_checkavail is not present

Click on Check Availability button
    click button    class:btn_checkavail

Wait that the page contain the text Yippie! The ID you've chosen is available
    wait until element contains    css:#check_availability > font > b     Yippie! The ID you've chosen is available.      20 seconds      Text Yippie! The ID you've chosen is available not found

Validate the Password text or attribute present inside HTML script of Password Field
    element should contain    //td[text() = 'Password']     Password    Password Text not found

Type on Password Field
    input password    css=input[name*='passwd']     test@1234

Validate the retype Password text in Retype Password Field
    element should contain    //td[text() = 'Retype password']     Retype password    Retype password Text not found

Type on Retype Password Field
    input password    css=input[name*='confirm_passwd']     test@1234


Validate that text Click if you don't have an alternate ID is present
    page should contain     Click if you don't have an alternate ID

Validate that checkbox is not selected
    checkbox should not be selected    xpath://input[@type='checkbox']

Click on the checkbox Click if you don't have an alternate ID
#    click element    xpath://input[@type='checkbox']
    select checkbox    xpath://input[@type='checkbox']
    sleep   2 seconds
    unselect checkbox    xpath://input[@type='checkbox']
    sleep   2 seconds
    select checkbox    xpath://input[@type='checkbox']

Validate the text Select a Security Question
    element should contain    //td[text() = 'Select a Security Question']     Select a Security Question    Select a Security Question Text not found

Choose the option of What is your favourite pass-time from drop down
    select from list by index    xpath://select[contains(@name, 'hintq')]       2

Validate the text Enter an Answer
    element should contain    //td[text() = 'Enter an Answer']     Enter an Answer    Enter an Answer Text not found

Type the security answer
    input password    css=input[name*='hinta']     Cricket

Validate the text Mother's Maiden Name
    element should contain    //*[@id='div_hintQS']/table/tbody/tr[6]/td[1]     Mother's Maiden Name    Mother's Maiden Name Text not found

Type on Mother's Maiden Name field
    input text    xpath://input[contains(@name, 'mothername')]       Sukla

Validate that text Mobile Number is present
    element should contain    //td[text() = 'Mobile No.']     Mobile No.    Mobile No. Text not found

Choose USA option from Drop down
    # First click on the drop down
    click element    xpath://*[@id='div_mob']/table/tbody/tr/td[3]/div[2]
    # Second click on the option USA
    click element    xpath://*[@id='country_id']/ul/li[2]

Type on the Mobile No. field
    input text      xpath://input[contains(@name, 'mobno')]     994551

Validate that the text Date of Birth is present
    element should contain    //td[text() = 'Date of Birth']     Date of Birth    Date of Birth Text not found

Choose third day option from Day Drop down
    select from list by label    xpath://select[contains(@name, 'DOB_Day')]     03

Choose April Month option from Month Drop down
    select from list by value    xpath://select[contains(@name, 'DOB_Month')]     04

Choose 2020 Year option from Year Drop down
    select from list by index    xpath://select[contains(@name, 'DOB_Year')]    4

Validate that attribute value f is presemt for female radio button value attribute
    element attribute value should be    xpath://input[contains(@name, 'gender')]      value    f

Choose the female radio button
#    select radio button    gender   f
    click element    xpath://input[@value='f']

Validate that the text Country is present
    element should contain    css:#tblcrtac > tbody > tr:nth-child(27) > td:nth-child(1) > span     Country

Choose Austria option from Country Drop down
    select from list by value    xpath://select[contains(@name, 'country')]     13

Close Browser Window
    close browser

Take Stepwise Screenshot
    [Arguments]    ${STEPNAME}
    capture page screenshot    ${STEPNAME}_Create_Account_{index}.png
