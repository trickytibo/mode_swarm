*** Settings ***
Resource          ../Conf/Conf_navig_web.txt
Library           Selenium2Library

*** Variables ***
${url}            http://84.39.33.161
${browser}        ff
${name}           ALLAIN Thibaut
${mail}           thibaut.allain@orange.com
${subject}        test Robot Framework
${text}           Ceci n'est pas un test.

*** Keywords ***
Open Browser    http://84.39.33.161:8000/
Set Window Size    400    700
Wait Until Element Is Visible    mobile-navigation
Click Element    id=mobile-navigation
Click Element    xpath=//a[@href='about.html']
Wait Until Page Contains    Our website templates are created with inspirati
on
Wait Until Element Is Visible    mobile-navigation
Click Element    id=mobile-navigation
Click Element    xpath=//a[@href='contact.html']
Wait Until Page Contains    DO NOT HESITATE TO CONTACT US
Input Text    Name    ${name}
Input Text    Email Address    ${mail}
Input Text    Subject    ${subject}
Input Text    message    ${text}
Capture Page Screenshot    result.png 
