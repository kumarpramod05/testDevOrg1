public with sharing class AddTaskExtension
{

    

    public List<wrapperClass>taskList{get;set;} 
    
    
    public AddTaskExtension(){}
    
    public AddTaskExtension(ApexPages.StandardSetController stdcontroller){
    
        taskList = new List<wrapperClass>();
        
        wrapperClass objWrapper1 = new wrapperClass(1);
        wrapperClass objWrapper2 = new wrapperClass(2);
        wrapperClass objWrapper3 = new wrapperClass(3);
        wrapperClass objWrapper4 = new wrapperClass(4);
        wrapperClass objWrapper5 = new wrapperClass(5);
        
        taskList.add(objWrapper1);
        taskList.add(objWrapper2);
        taskList.add(objWrapper3);
        taskList.add(objWrapper4);
        taskList.add(objWrapper5);
        
    }
    
    public class wrapperClass{
        
        public Integer index{get;set;}
        public Task__c tasks{get;set;}
        
        private wrapperClass(Integer value)
        {
            tasks = new Task__c();
            index = value;
        }
       public wrapperClass(){} 
    
    
    }
    
    public void Save(){
    
    try{
            List<Task__c>temp = new List<Task__c>();
            
            for(wrapperClass w:taskList){
            
                temp.add(w.tasks);
            }
            if(temp.size()> 0 )
            insert temp;    
        }
      catch(Exception e) 
                   {
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'ERROR:3 ' + e.getMessage());
                    ApexPages.addMessage(myMsg);
                  }  
    
    }

    public void Cancel(){}
}