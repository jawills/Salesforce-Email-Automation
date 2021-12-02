public class OutboundEmail {
    @invocableMethod (label= 'Send From Process') public static void sendEmailFromProcess(List<Id> oppIds){
        List<Opportunity> opps = [SELECT Id, contact__c FROM Opportunity WHERE Id in: oppIds];
        for(Opportunity o : opps){
            sendEmail(o);
        }
    }

    public static void sendFromTriggerOrBatch(List<Opportunity> opps){
        for(Opportunity o : opps){
            sendEmail(o);
        }
    }

    private static void sendEmail(Opportunity o){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(o.contact__c); // Required for sender. If you don't have a contact you will need to create a new contact/lead/user with an email address
        mail.setCcAddresses(new List<String> {'test@test.com'});
        mail.setWhatId(o.Id);
        mail.setOrgWideEmailAddressId('0D25e0000004EjqCAE');
        mail.setSaveAsActivity(true);			
        mail.setTemplateId('00X5e000000ZNX6EAO'); 
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}
