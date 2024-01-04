*** Settings ***
Documentation    To work with data drivern where keywords are kept to read data from cell
Library     SeleniumLibrary
Library     Collections
Library     ../ExternalKeywords/DataDrivenKeywords.py


*** Variables ***


*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${URL}   ${BROWSER}  ${OPTIONS}
    open browser   ${URL}   ${BROWSER}  ${OPTIONS}
    maximize browser window

Type in Username
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${USERNAME}=    Read Locator    Registration.username_id
    ${USERNAMEVALUE}=     Read Data From Cell     ${SHEETNAME}    ${ROWNUMBER}   ${COLUMNNUMBER}
    input text     id:${USERNAME}        ${USERNAMEVALUE}

Type in Password
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${PASSWORD}=    Read Locator    Registration.password_id
    ${PASSWORDVALUE}=      Read Data From Cell     ${SHEETNAME}    ${ROWNUMBER}   ${COLUMNNUMBER}
    input password    id:${PASSWORD}   ${PASSWORDVALUE}

Click on Sign in Button
    ${SIGNIN}=    Read Locator    Registration.signin_name
    click button    name:${SIGNIN}

Click on Logout
    ${Logout}=    read Locator    Inbox.logout_xpath
    click link      xpath:${Logout}

Close the Browser
    close browser

Read Locator
    [Arguments]    ${JSONPATH}
    ${VALUE}=   read locator from json    ${JSONPATH}
    [Return]    ${VALUE}

Read Data From Cell
    [Arguments]    ${sheetName}  ${row}  ${column}
    ${dataValue}=    get data from cell  ${sheetName}  ${row}  ${column}
    [Return]    ${dataValue}
