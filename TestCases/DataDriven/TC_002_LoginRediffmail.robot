*** Settings ***
Documentation    To work with data driven testing
Library     SeleniumLibrary
Resource    ../../Resources/RS_013_RediffmailLoginDataDriven.robot
Library     ../../ExternalKeywords/DataDrivenKeywords.py



*** Variables ***


*** Test Cases ***
TC_002 To login to rediffmail app using Data Driven
    [Documentation]    Working with Data Driven Approach
    [Teardown]    run keyword if test failed    capture page screenshot     Failed_Screen_Data_Driven_{index}.png
    ${MAXROW}=    get max row number    Data
    log to console    ${MAXROW}     # 4

    # For loop is starting from 2 as the actual row value is starting from 2 row in TestDataDriven.xlsx
    FOR     ${i}    IN RANGE    2   ${MAXROW}+1
        Open Browser and Maximize    https://mail.rediff.com/cgi-bin/login.cgi     chrome   --disable-notifications
        Type in Username    Data    ${i}    1
        sleep    3 seconds
        Type in Password    Data    ${i}    2
        sleep    3 seconds
        Click on Sign in Button
        sleep    10 seconds
        Click on Logout
        sleep    3 seconds
        Close the Browser
    END


