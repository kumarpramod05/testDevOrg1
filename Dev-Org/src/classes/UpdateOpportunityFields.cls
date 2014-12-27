global class UpdateOpportunityFields implements Database.Batchable<sObject>{

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('select id from opportunity limit 500');
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
       update scope;
   }

   global void finish(Database.BatchableContext BC){

   }

}