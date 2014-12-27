/****************************************************************************
  Used to call a web service whenever account is trggered 
  @Author    XXXX
*****************************************************************************/
global class AccountTriggerHelper {
    //private static String SERVICE_URL = 'http://203.129.200.123:8080/IntegrationAPI/services/UpsertSalesforceRecordIntoDB?method=runJob&argarg1=--context_param%20salesforce_record_id=';
    public static boolean flag = false;
    private static String SERVICE_URL = 'http://203.129.200.123:8080/UpsertSalesforceRecordIntoMSSQL/services/UpsertSalesforceRecordIntoMSSQL?method=runJob&argarg1=--context_param%20salesforce_record_id=';
    //'http://203.129.200.123:8080/MaintainLogUpsertSalesforceRecordIntoDB_0.1/services/MaintainLogUpsertSalesforceRecordIntoDB?method=runJob&argarg1=--context_param%20salesforce_record_id=';
   
    private static String methodType = 'GET';
    /**
     * 
     *
     */
    @future(callout=true)
    public static void upsertRecord(Id accountId){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setEndpoint(SERVICE_URL + accountId);
        req.setMethod(methodType);
        try {
            res = http.send(req);
        } catch(System.CalloutException e) {
            system.debug('********ERROR********'+res.toString());
        }
        Account acc = [select Id, IsSync__c from Account where Id = :accountId];
        acc.IsSync__c = false;
        update acc;
    }
    public static void updateAccount(Id accountId) {
        Account acc = [select Id, IsSync__c from Account where Id = :accountId];
        acc.IsSync__c = false;
        update acc;
        flag  = true;
    }
    /*
    public static void setExternalId(Id accountId){
        Account account = new Account(Id = accountId);
        account.external_id__c = accountId;
        update account;
    }*/
}