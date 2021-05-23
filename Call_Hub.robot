*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
Test Teardown   Close Browser

*** Test Cases ***
Validate the pricing of various subscriptions (Monthly/Quarterly/Half-yearly/Yearly) for all the plans on the page.
    [Tags]    DEBUG
    open browser    https://callhub.io/pricing/     chrome
    maximize browser window
    Verify correct subscription option under monthly is shown
    Verify correct subscription option under quarterly is shown
    Verify correct subscription option under half-yearly is shown
    Verify correct subscription option under yearly is shown

*** Keywords ***
Verify correct subscription option under monthly is shown
    wait until element is visible       //*[text()='Monthly']/parent::li    30
    wait until element is enabled       //*[text()='Monthly']/parent::li    30
    click element       //*[text()='Monthly']/parent::li
    wait until element is visible           //tbody/tr/td[3]/div[2]/h3[1]   120
    ${monthly_plan_1}=   get text           //tbody/tr/td[3]/div[2]/h3[1]
    should be true   '${monthly_plan_1}'=='$199.98/mo '
    wait until element is visible           //tbody/tr/td[4]/div[2]/h3[1]   120
    ${monthly_plan_2}=   get text           //tbody/tr/td[4]/div[2]/h3[1]
    should be true   '${monthly_plan_2}'=='$499.95/mo '

Verify correct subscription option under quarterly is shown
    wait until element is visible       //*[text()='Quarterly']/parent::li    30
    wait until element is enabled      //*[text()='Quarterly']/parent::li    30
    click element       //*[text()='Quarterly']/parent::li
    wait until element is visible           //tbody/tr/td[3]/div[2]/h3[1]   120
    ${quarterly_plan_1}=   get text           //tbody/tr/td[3]/div[2]/h3[1]
    ${unwanted}=   get text     //tbody/tr/td[3]/div[2]/h3[1]//sub/del
    ${quarterly_plan_1}=    remove string   ${quarterly_plan_1}     ${unwanted}     ${SPACE}    '
    ${quarterly_plan_1}     convert to string   ${quarterly_plan_1}
    should be true   '${quarterly_plan_1}'=='$189.98/mo'
    wait until element is visible           //tbody/tr/td[4]/div[2]/h3[1]   120
    ${quarterly_plan_2}=   get text           //tbody/tr/td[4]/div[2]/h3[1]
    ${unwanted2}=   get text     //tbody/tr/td[4]/div[2]/h3[1]//sub/del
    ${quarterly_plan_2}=    remove string   ${quarterly_plan_2}     ${unwanted2}     ${SPACE}    '
    ${quarterly_plan_2}     convert to string   ${quarterly_plan_2}
    should be true   '${quarterly_plan_2}'=='$474.95/mo'

Verify correct subscription option under half-yearly is shown
    wait until element is visible       //*[text()='Half-yearly']/parent::li    30
    wait until element is enabled      //*[text()='Half-yearly']/parent::li    30
    click element       //*[text()='Half-yearly']/parent::li
    wait until element is visible           //tbody/tr/td[3]/div[2]/h3[1]   120
    ${Half-yearly_1}=   get text           //tbody/tr/td[3]/div[2]/h3[1]
    ${unwanted}=   get text     //tbody/tr/td[3]/div[2]/h3[1]//sub/del
    ${Half-yearly_1}=    remove string   ${Half-yearly_1}     ${unwanted}     ${SPACE}    '
    ${Half-yearly_1}     convert to string   ${Half-yearly_1}
    should be true   '${Half-yearly_1}'=='$185.98/mo'
    wait until element is visible           //tbody/tr/td[4]/div[2]/h3[1]   120
    ${Half-yearly_2}=   get text           //tbody/tr/td[4]/div[2]/h3[1]
    ${unwanted2}=   get text     //tbody/tr/td[4]/div[2]/h3[1]//sub/del
    ${Half-yearly_2}=    remove string   ${Half-yearly_2}     ${unwanted2}     ${SPACE}    '
    ${Half-yearly_2}     convert to string   ${Half-yearly_2}
    should be true   '${Half-yearly_2}'=='$464.95/mo'

Verify correct subscription option under yearly is shown
    wait until element is visible       //*[text()='Yearly']/parent::li    30
    wait until element is enabled      //*[text()='Yearly']/parent::li    30
    click element       //*[text()='Yearly']/parent::li
    wait until element is visible           //tbody/tr/td[3]/div[2]/h3[1]   120
    ${Yearly_1}=   get text           //tbody/tr/td[3]/div[2]/h3[1]
    ${unwanted}=   get text     //tbody/tr/td[3]/div[2]/h3[1]//sub/del
    ${Yearly_1}=    remove string   ${Yearly_1}     ${unwanted}     ${SPACE}    '
    ${Yearly_1}     convert to string   ${Yearly_1}
    should be true   '${Yearly_1}'=='$179.98/mo'
    wait until element is visible           //tbody/tr/td[4]/div[2]/h3[1]   120
    ${Yearly_2}=   get text           //tbody/tr/td[4]/div[2]/h3[1]
    ${unwanted2}=   get text     //tbody/tr/td[4]/div[2]/h3[1]//sub/del
    ${Yearly_2}=    remove string   ${Yearly_2}     ${unwanted2}     ${SPACE}    '
    ${Yearly_2}     convert to string   ${Yearly_2}
    should be true   '${Yearly_2}'=='$449.96/mo'