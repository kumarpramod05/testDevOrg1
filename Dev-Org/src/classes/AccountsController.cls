/***
 * Used by AccountDetail page
 * @Author Rekha
 */
public with sharing class AccountsController {

    /**
     * Properties of Account which are used in AccountDetail Page
     */
    public Boolean addNewRecordActive {get; set;}
    public Account account {get; set;}
    public String accountName {get; set;}
    private String QueryString = '';
    public Id accountId {get; set;}
    public ApexPages.StandardSetController setCon {get;set;} 
    
    /**
     * Constructor of this class
     * @param    controller    ApexPages.StandardSetController
     */
    public AccountsController(ApexPages.StandardController controller) {
        search();
        addNewRecordActive = false;
    }
    
    /**
     * Method to display form of new record
     * @return    void
     */
    public void addNewRecord(){
        account = new Account();
        addNewRecordActive = true;
    }
    
    /**
     * Method to display the page in edit mode of the record
     * @return    void
     */
    public void editAccount(){
        account = [Select Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site from Account where Id =: accountId limit 1];
        addNewRecordActive = true;
    }
    
    /**
     * Method to delete record
     * @return    void
     */
    public void deleteAccount(){
        delete (new Account(Id = accountId));
        search();
    }
    
    /**
     * Method to save new account
     * @return    void
     */
    public void saveAccount(){
        upsert account;
        addNewRecordActive = false;
        search();
        AccountTriggerHelper.upsertRecord(account.Id);
    }
    
    /**
     * Method to cancel new account form 
     * @return    void
     */
    public void cancelAccount(){
        addNewRecordActive = false;
    }
    
    /**
     * Method to return list of Accounts
     * @return    list
     */
    public list<Account> getAccounts() {
        return (list<Account>)setCon.getRecords();
    }
    
    /**
     * Method to search account which is entered in search box
     * @return    PageReference 
     */
    public PageReference search(){
        if(accountName != null && accountName != ''){
            QueryString = 'SELECT Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site FROM Account where Name LIKE \'%' +accountName+ '%\' order by lastmodifiedDate desc';         
        }
        else {
            QueryString = 'Select Id, Name, AccountNumber, Website, NumberOfEmployees, Phone, Sic, Site from Account order by lastmodifiedDate desc';
        }
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(QueryString));
        setCon.setPageSize(10);
        setCon.setPageNumber(1);
        return null;
    }
}