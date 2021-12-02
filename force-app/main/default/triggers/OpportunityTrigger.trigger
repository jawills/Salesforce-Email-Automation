trigger OpportunityTrigger on Opportunity (before update) {
    if(Trigger.isBefore){
        OutboundEmail.sendFromTriggerOrBatch(Trigger.new);
    }
}