/**
 *  @author pramod
 *  @since  CES Version
 *  This class contains all the methods which are used to assign/edit/delete "Team Members"  to a Team.
 */
public with sharing class TeamCreateExtension {
        
   
    public List<TeamMemberWrapper>TeamMemberWrapperList{get;set;}
    public boolean isAllSelected {get; set;}
    public ID teamId {get; set;}
    public CT_Team__c Team {get; set;}
    public static String MSG_SELECT_VALID_ROLE = 'MEMBER Role: You must enter a value';
    public static String MSG_SELECT_MEMBER = 'MEMBER: You must enter a value';
    public static String URL_TEAM_PAGE = 'https://ap1.salesforce.com/';
    public String Name{get;set;} 
   
    ApexPages.StandardController controller;
    
    public TeamCreateExtension(ApexPages.StandardController con) {
    
       controller = con;      
         
       TeamMemberWrapperList = new  List<TeamMemberWrapper>();
       
       addMemberRecord();
    
    }
    
    /**
    * Wrapper class for CT_Team__c object.
    */    
    private Class TeamMemberWrapper
    {
        public boolean isSelected {get;set;}
        public boolean isDeleted {get;set;}
        public CT_Team__c member {get;set;}
       
       /**
        * default constructor
        */        
        public TeamMemberWrapper(){
            member = new CT_Team__c();
            isDeleted = false;
            isSelected = false;
           
        }
        
       /**
        * parameterized constructor
        */        
        public TeamMemberWrapper(CT_Team__c memberRecord){
            member = memberRecord;     
            isDeleted = false;
            isSelected = false;  
                  
        }        
    }  
     
    /**
    * This method is used to add a new TeamMember record.
    */        
    public void addMemberRecord(){
        TeamMemberWrapperList.add(new TeamMemberWrapper());
    }   
     
     
    
   /**
    * This method is used to delete record(s) of team members.
    */         
    public void deleteMemberRecord(){
        if(TeamMemberWrapperList != null){
            for(Integer i=0; i < TeamMemberWrapperList.size(); i++){
                if(TeamMemberWrapperList[i].isSelected){
                   TeamMemberWrapperList[i].isDeleted = true;
                    if(TeamMemberWrapperList[i].member.Team_Member__r.id == null || 
                        String.valueof(TeamMemberWrapperList[i].member.Team_Member__r.id).trim().length() == 0){
                            TeamMemberWrapperList.remove(i);
                            i--;
                    }
                }
            }
        }
    }    
    
   /**
    * This method is used to delete a single team member record.
            
    public void deleteSingleRecord(){
        List<CT_Team_Member__c> deleteList = [Select id From CT_Team__c WHERE  id =: TeamId and Team_Member__r.Id =:];
        if(deleteList.size() > 0) {
            delete deleteList;
        }
    }  */
    
    /**
    * This method eleminate empty records from list.
    */        
    private void eleminateEmptyRecords(){
        for(Integer i=0; i < TeamMemberWrapperList.size(); i++){
            if((TeamMemberWrapperList[i].member.id == null || String.valueOf(TeamMemberWrapperList[i].member.Team_Member__r.id).trim().length() == 0) &&
                (TeamMemberWrapperList[i].member.Team_Member__r.User__c == null || String.valueOf(TeamMemberWrapperList[i].member.Team_Member__r.User__c).trim().length() == 0) &&
                (TeamMemberWrapperList[i].member.Member_Role__c == null || TeamMemberWrapperList[i].member.Member_Role__c.trim().length() == 0)){
                TeamMemberWrapperList.remove(i);
                i--;
            }
        }
    } 
    
     /**
    * @Cancel button action
    * @return   PageReference
       
    public PageReference cancel() {
        PageReference pageRef = new PageReference(URL_OPPORTUNITY_PAGE + oppId);
        return pageRef;
    }  */   
    
    /**
    * This method is used to save pricingAssistUserRole records.
    * @return   PageReference
    */
    public PageReference save() {       
        PageReference pageRef = null;
        Boolean isError = false;
        List<CT_Team__c> upsertList = new List<CT_Team__c>();
        List<CT_Team__c> deleteList = new List<CT_Team__c>();
        List<String> deleteUsersList = new List<String>();
        List<String> upsertUsersList = new List<String>();
        //Set<Id> upsertUsersList = new Set<Id>();
        
        eleminateEmptyRecords();
        System.assertEquals(false,isError);
        if(TeamMemberWrapperList != null && TeamMemberWrapperList.size() > 0 ){
            for(TeamMemberWrapper roleWrapper : TeamMemberWrapperList){
                if(roleWrapper.member.Team_Member__c != null && roleWrapper.member.Member_Role__c != null 
                    && roleWrapper.member.Member_Role__c.trim().length() > 0 ) {
                        if(roleWrapper.isDeleted){
                            if(roleWrapper.member.id != null){
                                deleteList.add(roleWrapper.member);
                                deleteUsersList.add(roleWrapper.member.Team_Member__c);
                            }
                        } else {                
                            if(roleWrapper.member.id == null || 
                                String.valueof(roleWrapper.member.id).trim().length() == 0){
                               // roleWrapper.member.Opportunity__c = oppId;                           
                            }
                            upsertList.add(roleWrapper.member);
                            upsertUsersList.add(roleWrapper.member.Team_Member__r.Id);
                        }                   
                } else {                    
                    isError = true;
                    if(roleWrapper.member.Team_Member__c == null && (roleWrapper.member.Member_Role__c == null || 
                    roleWrapper.member.Member_Role__c.trim().length() == 0)){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , MSG_SELECT_MEMBER));       
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , MSG_SELECT_VALID_ROLE));        
                    } else if(roleWrapper.member.Team_Member__c == null){
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , MSG_SELECT_MEMBER));                  
                    } else {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , MSG_SELECT_VALID_ROLE));    
                    }
                }
            }           
        }
        
       // System.assertEquals(true,upsertUsersList.size() > 0 );
        
        
       if(isError ){
           
           
         return null;
       
        } 

        Savepoint sp = Database.setSavepoint(); 
        CT_Team__c obj = new CT_Team__c();
        try {
            
            if(deleteList.size() > 0){          
               // delete [SELECT id FROM OpportunityShare WHERE UserOrGroupId IN: deleteUsersList AND OpportunityID =: oppId and OpportunityAccessLevel = 'Edit'];
                System.debug('deleteListSize---------->'+deleteList.size());
                delete deleteList;
            }
            
            if(upsertList.size() > 0) {
              
               System.debug('Team4---------->'+upsertUsersList.size());
               upsert upsertList;
               
               for(CT_Team__c tmList:[select Id ,Team_Member__r.Id from CT_Team__c where Id IN :upsertList]){
               upsertUsersList.add(tmList.Team_Member__r.Id);
              // System.assert(false,tmList.Team_Member__r.Id);
               }
             

              obj.Name = Name;
             // insert obj;
              
             // CT_Team__c objNew = [select ID,Team_Member__r.Id from CT_Team__c where Id =:obj.Id];
              
              for(String tmList:upsertUsersList){
              obj.Team_Member__c = tmList;
             //  upsertUsersList.add(tmList.Team_Member__r.Id);
               }
              
             upsert obj;
              //delete upsertList;
            }
          /* List<CT_Team__c> teamIdList = [SELECT id FROM CT_Team__c WHERE id IN :upsertList];
           teamId = teamIdList.get(0).Id;*/
           pageRef = new PageReference(URL_TEAM_PAGE +obj.Id);
           //pageRef = new PageReference(URL_TEAM_PAGE + teamId);          
        } catch(Exception ex) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , ex.getMessage()));
            Database.rollback(sp); 
        }
        return pageRef;
        
    }  
}