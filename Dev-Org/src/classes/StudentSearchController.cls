public with sharing class StudentSearchController {

    public String studentName{public get; public set;}
    
    public List<Student__c> students{get;set;}
    
    public Integer studenSeq{get;set;}
     
    public StudentSearchController(ApexPages.StandardController controller) {
    }
    
    public StudentSearchController() {
    }

    public PageReference search(){
   PageReference pageRef = Page.HelloWord;
    pageRef.setRedirect(false); 
    return pageRef;    
    }
    
        public List<Student__c> getStudentDetails(){
        students = [select id, name from Student__c];     
        return students ;   
    }
}