*** Settings ***
Library  AppiumLibrary

*** Variables ***
#${username}             username
#${accesskey}            accesskey
${LT_GRID_URL}          https://${username}:${accesskey}@mobile-hub.lambdatest.com/wd/hub
${platformName}         android
${platformVersion}      11  # Set your default version
${deviceName}           Galaxy.*
${visual}               True
${devicelog}            True
${network}              True
${console}              True
${isRealMobile}         True
${TIMEOUT}              3000


*** Keywords ***

Open test app
    [Timeout]   ${TIMEOUT}
    ${CAPABILITIES}=    Create Dictionary
    ...   platformName=${platformName}
    ...   platformVersion=${platformVersion}
    ...   deviceName=${deviceName}
    ...   visual=${visual}
    ...   network=${network}
    ...   console=${console}
    ...   devicelog=${devicelog}
    ...   isRealMobile=${isRealMobile}
    ...   name=LT_Appium_Robot_App_Android
    ...   build=LT_Appium_Robot_App_Automation
    TRY
        ${REMOTE_URL}=    Set Variable If    '%{LT_GRID_URL}' == ''    mobile-hub.lambdatest.com    %{LT_GRID_URL}
    EXCEPT
        ${REMOTE_URL}=    Set Variable    mobile-hub.lambdatest.com
    END
    ${REMOTE_URL}=   Set Variable       https://${username}:${accesskey}@${REMOTE_URL}/wd/hub

    Open Application  ${REMOTE_URL}  platformName=${platformName}  platformVersion=${platformVersion}  deviceName=${deviceName}  visual=${visual}  console=${console}  network=${network}  devicelog=${devicelog}  isRealMobile=${isRealMobile}  name=LT_Appium_Robot_Web  build=LT_Appium_Robot_Web_Automation

Close test app
    Close All Applications