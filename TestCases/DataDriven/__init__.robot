*** Settings ***
Suite Setup    Before Suite Run
Suite Teardown    After Suite Run



*** Keywords ***
Before Suite Run
    log to console    Before Suite Runs

After Suite Run
    log to console    After Suite Runs