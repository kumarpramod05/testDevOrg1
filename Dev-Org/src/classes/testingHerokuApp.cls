/***
* Used to call a web service on scheduled basis 
* @Author Ritesh
***/
public class testingHerokuApp{
    
    private static String methodType = 'GET';
    private String webURL = 'http://203.129.200.123:8080/BulkUploadIntoSalesforce_0.1/services/BulkUploadIntoSalesforce?method=runJob';
    /**
    * Method executes on scheduled time and webservice method
    * @param    SC    SchedulableContext 
    * @return   void
    **/
    public void execute() {
        callWebService(webURL);
    }
    
    /**
    * Method to call webservice by get method
    * @param    url    String
    * @return   void
    **/
    @future(callout=true)
    private static void callWebService( String url ){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setEndpoint( url );
        req.setMethod(methodType);
        try {
            res = http.send(req);
            system.debug('***********'+ res.getBody());
        } catch(System.CalloutException e) {
            System.debug('**********' + res.toString());
        }
    }
}