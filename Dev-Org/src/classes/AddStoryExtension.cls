public with sharing class AddStoryExtension
{
    public String Msg{get;set;}
    public List<wrapperClass>storyList{get;set;} 
    
    
    public AddStoryExtension(){}
    
    public AddStoryExtension(ApexPages.StandardSetController stdcontroller){
    
        storyList = new List<wrapperClass>();
        
        wrapperClass objWrapper1 = new wrapperClass(1);
        wrapperClass objWrapper2 = new wrapperClass(2);
        wrapperClass objWrapper3 = new wrapperClass(3);
        wrapperClass objWrapper4 = new wrapperClass(4);
        wrapperClass objWrapper5 = new wrapperClass(5);
        
        storyList.add(objWrapper1);
        storyList.add(objWrapper2);
        storyList.add(objWrapper3);
        storyList.add(objWrapper4);
        storyList.add(objWrapper5);
        
    }
    
    public class wrapperClass{
        
        public Integer index{get;set;}
        public CT_Story__c stories{get;set;}
        
        private wrapperClass(Integer value)
        {
            stories = new CT_Story__c();
            index = value;
        }
       public wrapperClass(){} 
    
    
    }
    
    public void Save(){
    
    try{
            List<CT_Story__c>temp = new List<CT_Story__c>();
            
            for(wrapperClass w:storyList){
            
                temp.add(w.stories);
            }
            if(temp.size() > 0)
            insert temp; 
            
        }
      catch(Exception e) 
                   {
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'ERROR:1 ' + e.getMessage());
                    ApexPages.addMessage(myMsg);
                  }  
    
    }

    public void Cancel(){}
}