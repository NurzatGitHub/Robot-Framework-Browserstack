*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${BROWSERSTACK_USER}       bsuser_iaqQYs
${BROWSERSTACK_KEY}        XsSnxjz2CLL5QxmAMtUj
${REMOTE_URL}              https://${BROWSERSTACK_USER}:${BROWSERSTACK_KEY}@hub-cloud.browserstack.com/wd/hub
${URL}                     https://demoqa.com
${BROWSER}                 Chrome
${TIMEOUT}                 30

*** Keywords ***
Open Browser Stack Session
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium
    ${caps}=    Create Dictionary
    ...    browserName=${BROWSER}
    ...    os=Windows
    ...    osVersion=10
    ...    browserstack.user=${BROWSERSTACK_USER}
    ...    browserstack.key=${BROWSERSTACK_KEY}
    ...    browserstack.sessionName=${SUITE NAME} - ${TEST NAME}
    ...    browserstack.buildName=STAH2_Homework
    ...    browserstack.projectName=MTSD_Automation
    ...    browserstack.local=false
    ...    browserstack.selenium_version=4.1.0
    
    Open Browser    ${URL}    browser=${BROWSER}    remote_url=${REMOTE_URL}
    ...    desired_capabilities=${caps}
    Set Selenium Timeout    ${TIMEOUT}
    Maximize Browser Window

*** Test Cases ***
Test 1 - Verify Home Page Sections
    [Setup]    Open Browser Stack Session
    Page Should Contain    Elements
    Page Should Contain    Forms
    Capture Page Screenshot
    [Teardown]    Close Browser

Test 2 - Check Interactive Elements
    [Setup]    Open Browser Stack Session
    Element Should Be Visible    xpath=//div[contains(@class,'card')][.//h5[contains(.,'Elements')]]
    Element Should Be Visible    xpath=//div[contains(@class,'card')][.//h5[contains(.,'Forms')]]
    Capture Page Screenshot
    [Teardown]    Close Browser


# Test 1 - Verify Homepage
#     [Setup]    Run Keywords
#     ...    Set Browser Options    AND
#     ...    Open Test Browser
#     Page Should Contain    ${ELEMENTS_TEXT}
#     Page Should Contain    ${FORMS_TEXT}
#     Capture Page Screenshot
#     [Teardown]    Close Browser

# Test 2 - Check Elements Section
#     [Setup]    Run Keywords
#     ...    Set Browser Options    AND
#     ...    Open Test Browser
#     Verify Elements Section
#     Capture Page Screenshot
#     [Teardown]    Close Browser

# Test 3 - Check Forms Section
#     [Setup]    Run Keywords
#     ...    Set Browser Options    AND
#     ...    Open Test Browser
#     Click Element    xpath=//div[contains(@class,'card')][.//h5[contains(text(),'Forms')]]
#     Wait Until Page Contains    Practice Form    timeout=30
#     Page Should Contain Element    id=firstName
#     [Teardown]    Close Browser