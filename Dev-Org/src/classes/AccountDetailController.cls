public with sharing class AccountDetailController {

    public Account accountDetail{get; set;}

    public AccountDetailController(ApexPages.StandardController controller) {
        //setAccountDetail((Account) controller.getRecord());
        accountDetail  = (Account) controller.getRecord();

    }

}