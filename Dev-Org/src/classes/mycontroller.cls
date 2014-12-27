public with sharing class mycontroller {
    public mycontroller() {}

    public PageReference gotoStep1() {  
    PageReference pageRef = new PageReference('partial wizard URL');
    pageRef.setRedirect(false); 
    return pageRef;
    }

    public PageReference gotoStep2() {
    PageReference pageRef = new PageReference('partial wizard_step2 URL');
    pageRef.setRedirect(false); 
    return pageRef;   
   }

    public PageReference gotoStep3() {
    PageReference pageRef = new PageReference('partial wizard_step3 URL');
    pageRef.setRedirect(false); 
    return pageRef;   
    }
   }