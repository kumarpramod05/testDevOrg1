public class testToggle {
public Boolean pagehide {get; set;}
public Boolean editbtn {get; set;}
public Boolean outputedit {get; set;}
public String bill  {get; set;}
public String bill1 {get; set;}


    public void edit() {
      pagehide = false;
       editbtn = true;

    }
public void updateval(){
       outputedit = true;
       editbtn = false;
       apexPages.Message updateMsg = new apexPages.Message(ApexPages.Severity.Info,'Billing Address Updated Successfully ');
        apexPages.addMessage(updateMsg);
    }
}