trigger AccountTrigger on Account (after insert, after update) {
    system.debug('IsExecuting' + trigger.isExecuting + ' AccountTriggerHelper.flag***1*****' + AccountTriggerHelper.flag);
    //if(!trigger.isExecuting) {
        if( Trigger.isAfter) {
            if( Trigger.isInsert || Trigger.isUpdate) {      
                if( !Trigger.new.get(0).IsSync__c){
                    system.debug('Id = ' + Trigger.new.get(0).Id);    
                    AccountTriggerHelper.upsertRecord(Trigger.new.get(0).Id);
                }
                /*
                else if(!AccountTriggerHelper.flag){
                     /*Account acc = [select Id, IsSync__c from Account where Id = :Trigger.new.get(0).Id];
                     acc.IsSync__c = false;
                     update acc;
                     AccountTriggerHelper.flag  = true;
                     AccountTriggerHelper.updateAccount(Trigger.new.get(0).Id);
                     system.debug('IsExecuting' + trigger.isExecuting + ' AccountTriggerHelper.flag***2*****' + AccountTriggerHelper.flag);
                }*/
            }
        }     
   // }
    /*else {
        AccountTriggerHelper.flag = false;
    }*/
}