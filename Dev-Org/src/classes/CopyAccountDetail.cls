/***
* Used by AccountDetail page
* @Author Rekha
***/
public with sharing class CopyAccountDetail {

    /**
    * Properties of Account which are used in AccountDetail Page
    **/
    public list<Account> accountList;
    public Boolean addNewRecordActive {get; set;}
    public Account account {get; set;}
    public String accountName {get; set;}
    private String QueryString = '';
    public Id accountId {get; set;}
    public ApexPages.StandardSetController setCon {get;set;} 
    
    /**
    * Constructor of this class
    * @param    controller    ApexPages.StandardSetController
    **/
    public CopyAccountDetail(ApexPages.StandardSetController controller) {
        accountList = controller.getRecords();
        addNewRecordActive = false;
        
    }
    /**
    * Method to display form of new record
    * @return    void
    **/
    public void addNewRecord(){
        account = new Account();
        addNewRecordActive = true;
        //system.assert(false,addNewRecordActive);
    }

    public void editAccount(){
        account = [Select Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site from Account where Id =: accountId limit 1];
        addNewRecordActive = true;
        //system.assert(false,account);
        search();
    }
    public void deleteAccount(){
        system.debug('****'+accountId);
        delete (new Account(Id = accountId));
    }
    /**
    * Method to save new account
    * @return    void
    **/
    public void saveAccount(){
        upsert account;
        addNewRecordActive = false;
        search();
    }
    
    /**
    * Method to cancel new account form 
    * @return    void
    **/
    public void cancelAccount(){
        addNewRecordActive = false;
    }
    
    /**
    * Method to return list of Accounts
    * @return    list
    **/
    public list<Account> getAccounts() {
        if(setCon != null){
            accountList = (list<Account>)setCon.getRecords();
            return accountList;
        }
        else {
            search();
            accountList = (list<Account>)setCon.getRecords();
            return accountList;
        }
    }
    
    /**
    * Method to search account which is entered in search box
    * @return    PageReference 
    **/
    public PageReference search(){
        if(accountName != null){
            QueryString = 'SELECT Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site FROM Account where Name LIKE \'%' +accountName+ '%\'';         
        }
        else {
            QueryString = 'Select Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site from Account where Id IN : accountList';
        }
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(QueryString));
        setCon.setPageSize(10);
        setCon.setPageNumber(1);
        return null;
    }
}