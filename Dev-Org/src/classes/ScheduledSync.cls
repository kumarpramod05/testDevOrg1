/****************************************************************************
  Name : ScheduledSync  
  Description : Used to call a web service on scheduled basis 
*****************************************************************************/
global class ScheduledSync implements Schedulable{
    //----------------------------------------------------------------------------
    //method executes on scheduled time and webservice method
    //----------------------------------------------------------------------------
    global void execute(SchedulableContext SC) {
        callWebService('http://neworgapp1.herokuapp.com/services/time/Ritesh');
    }
    
    //----------------------------------------------------------------------------
    //method to call webservice by get method
    //It will take weburl string in argument
    //----------------------------------------------------------------------------
    @future(callout=true)
    private static void callWebService( String url ){
        
        //Create Http object to call webservice
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setEndpoint( url );
        //set method type to get
        req.setMethod('GET');
        try {
            res = http.send(req);
            system.debug('***********'+ res.getBody());
        } catch(System.CalloutException e) {
        }
    }
}