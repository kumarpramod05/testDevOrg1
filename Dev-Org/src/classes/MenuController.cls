public with sharing class MenuController {
   public List<Menu__c> menus{get;set;}

    public MenuController(){
        menus = [select id, name, order__c, status__c, TargetPage__c from Menu__c menu order by order__c ASC];
        System.debug('***************************' + menus );
    }
    
    public Component.Apex.TabPanel getMyTabs()
    {
        Component.Apex.TabPanel myTabPanel = new Component.Apex.TabPanel();  
        //myTabPanel.style='font-size: 150px;';  
        myTabPanel.tabClass='activeTab' ;
        myTabPanel.inactiveTabClass='inactiveTab';
         for (integer i=0 ;i<menus.size();i++)  //just a sample, this could easily be a SOQL loop
         {
             Component.Apex.Tab myTab = new Component.Apex.Tab();
             myTab.Label = menus.get(i).name;
             myTab.name =  menus.get(i).name;
             myTab.switchtype = 'client';            
             myTab.style='font-size: 150px;';             
             // Iframe
             Component.Apex.Iframe iframe = new Component.Apex.Iframe();
             iframe.src = menus.get(i).targetPage__c;
             myTab.childComponents.add(iframe);
             myTabPanel.childComponents.add(myTab);
         }   
        return myTabPanel;
    }
    
}