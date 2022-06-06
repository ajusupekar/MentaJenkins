Feature: Menta Login Screen

  Background: 

  @Menta_1 @Menta_Sanity
  Scenario Outline: To verify that when user performs login with valid credential then user navigates to menta dashboard screen.
    Given android menta app is installed on the device and launched successfully"<deviceId>"
    When android user clink on the Sign in button
    Then android user should navigate to menta login screen
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen

    Examples: 
      | deviceId      | emailAddress | password   |
      | browser       | MentaEmail1  | MentaPass1 |
     

  @Menta_2 @CA_1 @Menta_Sanity
  Scenario Outline: To verify that user should be able to ADD CASH into Menta Checking Account using new card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before adding money into Menta Account
    When android user click on ADD CASH button
    And android user enters the "<Amount>"
    And android user click on Cash Add button
    When android user click on Add a card button
    And android user enters the card number "<CardNumber>"
    And android user enters the expiry date "<ExpiryDate>"
    And android user enters the security code "<code>"
    And android user enters the Zip Code "<ZipCode>"
    And android user enters the card name "<CardName>"
    And android user click on Add button
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added into Checking Account screen
    When android user click on Go To Dashboard button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After adding money into Menta Account

    Examples: 
      | emailAddress | password   | Amount | CardNumber       | ExpiryDate | code | ZipCode | CardName |
      | MentaEmail1  | MentaPass1 |     80 | 4444333322221111 |       1225 |  123 |  451524 | Axis     |

  @Menta_3 @CA_2 @Menta_Sanity
  Scenario Outline: To verify that user should be able to ADD CASH into Menta Checking Account using existing card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before adding money into Menta Account
    When android user click on ADD CASH button
    And android user enters the "<Amount>"
    And android user click on Cash Add button
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added into Checking Account screen
    When android user click on Go To Dashboard button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After adding money into Menta Account

    Examples: 
      | emailAddress | password   | Amount | code |
      | MentaEmail1  | MentaPass1 |     20 |  123 |

  @Menta_4 @CA_3 @Menta_Sanity
  Scenario Outline: To verify that user should be able to add new beneficiary and Send the Money request and refuse the same request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    And android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on Refuse button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note             | Email             | Pass             | ReqAmount |
      | MentaEmail1  | MentaPass1 |      6 | BeneficiaryEmail2 | CARequestNewUser | BeneficiaryEmail2 | BeneficiaryPass2 | $ 6.00    |

  @Menta_5 @CA_4 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Send the Money request to added beneficiary and accept the request.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Request button
    And android user enters the "<Amount>"
    And android user click on Request button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Request button
    Then android user land on Money Request sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android menta app should be closed
    Given android menta app is installed on the device and launched successfully
    When android user clink on the Sign in button
    When android user provides menta Username "<Email>" and Password "<Pass>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user click on Transactions Box
    Then android user land on Transactions screen
    When android user select the request base on note "<Note>" and amount "<ReqAmount>"
    And android user click on PayBack button
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Payment accept screen
    When android user click on Close button
    Then android user land on Transactions screen

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note              | Email             | Pass             | ReqAmount | Pin  |
      | MentaEmail1  | MentaPass1 |      7 | BeneficiaryEmail2 | CARequestExisUser | BeneficiaryEmail2 | BeneficiaryPass2 | $ 7.00    | 0000 |

  @Menta_6 @Set_Pin @Menta_Sanity
  Scenario Outline: To verify that user should be able Set the Pin.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Privacy and Security option
    Then android user land on Privacy and Security screen
    When android user click on Set Pin option
    And android user enters the pin"<Pin>"
    And android user enters the confirm pin"<Pin>"
    Then android user land on Pin created screen
    When android user click on Back to Profile Options button
    Then android user land on profile account screen

    Examples: 
      | emailAddress | password   | Pin  |
      | MentaEmail1  | MentaPass1 | 0000 |

  @Menta_7 @CA_5 @Menta_Sanity
  Scenario Outline: To verify that user should be able to add new menta user or beneficiary and Send the money from checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before sending the money to Menta user or beneficiary
    When android user click on Checking Account Send button
    And android user enters the "<Amount>"
    And android user click on Checking Account Send button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After sending the money to Menta user or beneficiary

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note          | Pin  |
      | MentaEmail1  | MentaPass1 |      8 | BeneficiaryEmail3 | CASendNewUser | 0000 |

  @Menta_8 @CA_6 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Send the Money to added Menta user or beneficiary from checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance Before sending the money to Menta user or beneficiary
    When android user click on Checking Account Send button
    And android user enters the "<Amount>"
    And android user click on Checking Account Send button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Checking Account Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Checking Account screen
    Then android user verify Checking Account balance After sending the money to Menta user or beneficiary

    Examples: 
      | emailAddress | password   | Amount | BeneficiaryEmail  | Note           | Pin  |
      | MentaEmail1  | MentaPass1 |      9 | BeneficiaryEmail3 | CASendExisUser | 0000 |

  @Menta_9 @RemoveCard @Menta_Sanity
  Scenario Outline: To verify that user should be able to remove the card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Linked Banks option
    Then android user land on Linked Banks screen
    When android user click on Link Debit Card option
    Then android user land on Cards screen
    When android user selecting the card "<Card>"
    And android user click on Remove Card button
    Then android user land on Card deleted screen
    Then android user land on Cards screen

    Examples: 
      | emailAddress | password   | Card |
      | MentaEmail1  | MentaPass1 | Axis |

  @Menta_10 @PA_1 @Menta_Sanity
  Scenario Outline: To verify that user should be able to create new pocket and add money using new card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user click on Create Pocket plus button
    Then android user land on Create Pocket screen
    When android user enter the pocket name"<PocketName>"
    And android user click on Pocket Submit button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Add a card button
    And android user enters the card number "<CardNumber>"
    And android user enters the expiry date "<ExpiryDate>"
    And android user enters the security code "<code>"
    And android user enters the Zip Code "<ZipCode>"
    And android user enters the card name "<CardName>"
    And android user click on Add button
    Then android user land on card created screen
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added screen
    When android user click on Go To Dashboard button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    Then android user verify newly added pocket should be displayed on the Pocket Account screen"<PocketName>"
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | CardNumber       | ExpiryDate | code | ZipCode | CardName |
      | MentaEmail1  | MentaPass1 | Trek       |    100 | 4111111111111111 |       1224 |  123 |  411035 | HDFC     |

  @Menta_11 @PA_2 @Menta_Sanity
  Scenario Outline: To verify that user should be able to create new pocket and add money using menta checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user click on Create Pocket plus button
    Then android user land on Create Pocket screen
    When android user enter the pocket name"<PocketName>"
    And android user click on Pocket Submit button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    Then android user land on Amount Added screen
    When android user click on Go To Dashboard button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | MentaEmail1  | MentaPass1 | Movie      |     10 | 0000 |

  @Menta_12 @PA_3 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Add Money into pocket using existing card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    When android user verify Pocket Balance before adding the money
    And android user click on Add Money button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user select the newly created card
    And android user click on card Next button
    And android user enter the security code"<code>"
    And android user click on Pay button
    Then android user land on Amount Added screen
    When android user click on Go To Dashboard button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | code |
      | MentaEmail1  | MentaPass1 | Trek       |     10 |  123 |

  @Menta_13 @PA_5 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Add Money into pocket using Menta Checking Account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    When android user verify Pocket Balance before adding the money
    And android user click on Add Money button
    Then android user land on add money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Fund your pocket screen
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    Then android user land on Amount Added screen
    When android user click on Go To Dashboard button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After adding the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | MentaEmail1  | MentaPass1 | Trek       |     10 | 0000 |

  @Menta_14 @PA_4 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Withdraw pocket money into Menta Checking Account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user verify Checking Account balance before adding money into pocket
    And android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user click on Withdraw button
    Then android user land on withdraw money screen
    When android user enters the "<Amount>"
    And android user click on Next button
    Then android user land on Withdraw money into account screen
    When android user click on Menta Checking Account button
    And android user enters the pin"<Pin>"
    And android user click on Go To Pocket Dashboard button
    Then android app should load the menta dashboard screen
    Then android user verify Checking Account balance After adding money into pocket

    Examples: 
      | emailAddress | password   | PocketName | Amount | Pin  |
      | MentaEmail1  | MentaPass1 | Trek       |     30 | 0000 |

  @Menta_15 @PA_6 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Send Pocket Money to new Menta user or beneficiary.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user verify Pocket Balance Before Sending the money
    And android user click on Send Money button
    And android user enters the "<Amount>"
    And android user click on amount Send button
    And android user enters the beneficiary email"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After Sending the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | BeneficiaryEmail  | Note          | Pin  |
      | MentaEmail1  | MentaPass1 | Trek       |      5 | BeneficiaryEmail4 | PASendNewUser | 0000 |

  @Menta_16 @PA_7 @Menta_Sanity
  Scenario Outline: To verify that user should be able to Send Pocket Money to added Menta user or beneficiary.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user verify Pocket Balance Before Sending the money
    And android user click on Send Money button
    And android user enters the "<Amount>"
    And android user click on amount Send button
    And android user select the added beneficiary"<BeneficiaryEmail>"
    And android user enters the note"<Note>"
    And android user click on Send button
    And android user enters the pin"<Pin>"
    Then android user land on Money sent screen
    When android user click on Close button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    Then android user verify Pocket Balance After Sending the money

    Examples: 
      | emailAddress | password   | PocketName | Amount | BeneficiaryEmail  | Note           | Pin  |
      | MentaEmail1  | MentaPass1 | Trek       |      6 | BeneficiaryEmail4 | PASendExisUser | 0000 |

  @Menta_17 @PA_8 @Menta_Sanity
  Scenario Outline: To verify that user should be able to update the pocket name.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user click on Edit Pocket name option
    Then android user land on Update Pocket screen
    When android user enters the new pocket name"<NewPocketName>"
    And android user click on Update button
    Then android user verify newly added pocket should be displayed on the Pocket Account screen"<NewPocketName>"

    Examples: 
      | emailAddress | password   | PocketName | NewPocketName |
      | MentaEmail1  | MentaPass1 | Movie      | Tea           |

  @Menta_18 @PA_9 @Menta_Sanity
  Scenario Outline: To verify that user should be able to close pocket and deposite pocket money into menta checking account.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user verify Checking Account balance before adding money into pocket
    And android user click on Pocket Account button
    Then android user land on Pocket Account screen
    When android user select the pocket edit option"<PocketName>"
    And android user click on Close Pocket button
    Then android user land on Close Pocket confirmation screen
    When android user select the Menta Account for deposite pocket money
    And android user enters the pin"<Pin>"
    When android user click on Go To Dashboard button
    Then android app should load the menta dashboard screen
    Then android user verify Checking Account balance After adding money into pocket

    Examples: 
      | emailAddress | password   | PocketName | Pin  |
      | MentaEmail1  | MentaPass1 | Trek       | 0000 |

  @Menta_19 @Order_Card @Menta_Sanity
  Scenario Outline: To verify that user should be able to Order a Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    And android user select the Order A Card option
    And android user click on Yes button
    Then android user land on Card Ordered screen
    When android user click on Go to Checking Dashboard button
    Then android user land on Checking Account screen

    Examples: 
      | emailAddress | password   |
      | MentaEmail1  | MentaPass1 |

  @Menta_20 @Replace_Card @Menta_Sanity
  Scenario Outline: To verify that user should be able to Replace the Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user select the Replace Card option
    And android user click on Confirm button
    Then android user land on Card Replaced screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      | MentaEmail1  | MentaPass1 |

  @Menta_21 @AddVirtual_Card @Menta_Sanity
  Scenario Outline: To verify that user should be able to Add Virtual Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user select the Add Vitual Card option
    Then android user land on Virtual Card Created screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      | MentaEmail1  | MentaPass1 |

  @Menta_22 @OnlineAndATM_Options @Menta_Sanity
  Scenario Outline: To verify that user should be able to change Online Payment and ATM Withdrawal Card settings options.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user select the Card Settings option
    Then android user land on Card Settings screen
    When android user select the existing card
    And android user click on Online Payment option
    And android user click on ATM Withdrawal option
    And android user click on Apply button
    And android user land on Card Settings changes apply screen
    Then android user land on Menta Spending Card screen

    Examples: 
      | emailAddress | password   |
      | MentaEmail1  | MentaPass1 |

  @Menta_23 @Lost_Card @Menta_Sanity
  Scenario Outline: To verify that user should be able to Block the Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Checking Account button
    Then android user land on Checking Account screen
    When android user select the Menta Spending Card
    Then android user land on Menta Spending Card screen
    When android user click on Lost Card button
    Then android user land on Block Card screen
    When android user click on Loss button
    And android user click on Block button
    Then android user land on Card Blocked screen
    Then android user land on Checking Account screen

    Examples: 
      | emailAddress | password   |
      | MentaEmail1  | MentaPass1 |

  @Menta_24 @Loan
  Scenario Outline: To verify that user should be able to Create or Apply for new loan and Pay EMI using Card.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on LOANS button
    Then android user land on Loan Dashboard screen
    When android user click on Apply new loan button
    And android user select the loan amount from dropdown"<LoanAmount>"
    And android user select the loan tenure"<Tenure>"
    And android user click on Loan Next button
    Then android user land on Loan Agreement screen
    When android user selects Terms and Condition checkbox

    #And android user click on Accept Contract button
    #And android user click on Agreement Next button
    #And android user click on Fee Accept button
    #And android user select the newly created card
    #And android user click on Make Payment button
    #And android user enter the security code"<code>"
    #And android user click on Pay button
    #And android user click on Go To Dashboard button
    #Then android app should load the menta dashboard screen
    #When android user click on LOANS button
    #Then android user land on Loan Dashboard screen
    #When android user select the newly created loan using Loan Name"<LoanName>" and Tenure"<Tenure>" and PaymentMethod "<PaymentMethod>" and code"<code>"
    #And android user click on EMI Make Payment button
    #And android user enters the EMI Amount
    #And android user click on EMI Amount Next button
    #And android user select the Payment Method for EMI"<PaymentMethod>"
    #And android user click on Make Payment Okay button
    #And android user enter the security code"<code>"
    #And android user click on Pay button
    #And android user click on Go To Dashboard button
    #Then android app should load the menta dashboard screen
    #When android user click on LOANS button
    #Then android user land on Loan Dashboard screen
    #When android user select the newly created loan using Loan Name"<LoanName>" and Tenure"<Tenure>"
    #Then Loan Closed button should be displayed on android app
    Examples: 
      | emailAddress | password   | LoanAmount | Tenure | code | LoanName       | PaymentMethod       |
      | MentaEmail1  | MentaPass1 |        500 |      2 |  123 | Builder Loan 1 | card ending in 1111 |

  @Menta_25 @Change_Pin @Menta_Sanity
  Scenario Outline: To verify that user should be able to Change the Pin.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on profile account option
    Then android user land on profile account screen
    When android user click on Privacy and Security option
    Then android user land on Privacy and Security screen
    When android user click on Change Pin option
    When android user enters the pin"<OldPin>"
    And android user enters the pin"<NewPin>"
    And android user enters the confirm pin"<NewPin>"
    Then android user land on Pin Changed screen
    When android user click on Back to Profile Options button
    Then android user land on profile account screen

    Examples: 
      | emailAddress | password   | OldPin | NewPin |
      | MentaEmail1  | MentaPass1 |   0000 |   1111 |

  @Menta_26 @ChangePassword @Menta_Sanity
  Scenario Outline: To verify that user should be able to change the password.
    When android user provides menta Username "<emailAddress>" and Password "<password>"
    And android user click on the menta login button
    Then android app should load the menta dashboard screen
    When android user click on Menu option
    And android user click on Account option
    Then android user land on Account screen
    When android user click on Change Password textbox
    Then android user land on Create new Password screen
    When android user enters the Old password"<OldPassword>"
    And android user enters the New password"<NewPassword>"and Confirm password"<NewPassword>"
    And android user click on Submit Password button
    Then android user land on Password updated screen
    When android user click on Okay button
    Then android user land on Enter password screen

    Examples: 
      | emailAddress | password   | OldPassword | NewPassword |
      | MentaEmail1  | MentaPass1 | MentaPass1  | MentaPass2  |

  @Menta_27 @ResetPassword @Menta_Sanity
  Scenario Outline: To verify that user should be able to Reset the password.
    When android user click on Forgot Password link text
    Then android user land on Forgot Password screen
    When android user enters the Email address"<EmailAddress>"
    And android user click on Reset Password Send button
    Then android user land on enter new password screen
    When android user enters the new password"<Respassword>"
    And android user click on Reset Password Send button
    Then android user land on Password changed screen
    When android user click on Finish button
    Then android user should navigate to menta login screen

    Examples: 
      | EmailAddress | Respassword |
      | MentaEmail1  | MentaPass3  |

  @Menta_28 @MentaRegistration
  Scenario Outline: To verify that user should be able to register the new users.
    When android user click on the Sign Up button
    And android user register the users depends on"<RegEmailCount>"and"<RegPassword>"
    And android user enter the registration email address
    And android user enter the registration password"<RegPassword>"
    And android user enter the registration confirm password"<RegPassword>"
    And android user click on register button
    And android user click on registration confirm button

    Examples: 
      | RegEmailCount | RegPassword |
      |             2 | RegPass     |
