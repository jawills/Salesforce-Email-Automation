public class OutboundEmailBatch implements Database.Batchable<sobject>,Database.AllowsCallouts, Schedulable{
    public void execute(SchedulableContext SC){
        OutboundEmailBatch rubt= new OutboundEmailBatch();
        Database.executeBatch(rubt, 10);
    }
    public Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('SELECT Id, Contact__c FROM Opportunity WHERE accountId =\'0015e00000FJlu0AAD\'');
    }
    
    public void Execute(Database.BatchableContext BC,List<Opportunity> oppList){
        OutboundEmail.sendFromTriggerOrBatch(oppList);
        update oppList;
    } 
    
    public void finish(Database.BatchableContext BC){
        System.debug('Finished');
    }
}
