*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                     https://www.saucedemo.com/
${REMOTE_URL}              https://hub-cloud.browserstack.com/wd/hub

${BROWSERSTACK_USER}       bsuser_iaqQYs
${BROWSERSTACK_KEY}        XsSnxjz2CLL5QxmAMtUj

${USERNAME}                standard_user
${PASSWORD}                secret_sauce

${username_field}          id:user-name
${password_field}          id:password
${login_button}            id:login-button
${add_button}              id:add-to-cart-sauce-labs-backpack
${remove_button}           id:remove-sauce-labs-backpack
${cart_icon}               id:shopping_cart_container
${cart_item}               class:inventory_item_name

*** Keywords ***
Set Chrome Capabilities
    ${caps}=    Create Dictionary
    ...    browserName=Chrome
    ...    os=Windows
    ...    osVersion=10
    ...    name=${TEST NAME}
    ...    browserstack.user=${BROWSERSTACK_USER}
    ...    browserstack.key=${BROWSERSTACK_KEY}
    Set Test Variable    ${CAPABILITIES}    ${caps}

Set Firefox Capabilities
    ${caps}=    Create Dictionary
    ...    browserName=Firefox
    ...    os=Windows
    ...    osVersion=10
    ...    name=${TEST NAME}
    ...    browserstack.user=${BROWSERSTACK_USER}
    ...    browserstack.key=${BROWSERSTACK_KEY}
    Set Test Variable    ${CAPABILITIES}    ${caps}
