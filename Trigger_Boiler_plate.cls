/*
Created by Huguette Mpudi 04/18/2022 to be completed 
*/
//This trigger uses Boolean context variables like Trigger.isBefore and Trigger.isDelete to define code that only executes for specific trigger

trigger myAccountTrigger on Account(before delete, before insert, before update, 
                                    after delete, after insert, after update) {
if (Trigger.isBefore) {
    if (Trigger.isDelete) {
 
    // Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities.');
    }
      
    } else if (Trigger.isInsert) {
       
        } else if (Trigger.isUpdate) {

             // Perform SOQL query once.    
    // Get the accounts and their related opportunities.
    List<Account> acctsWithOpps = 
        [SELECT Id,(SELECT Id,Name,CloseDate FROM Opportunities) 
         FROM Account WHERE Id IN :Trigger.New];
  
    // Iterate over the returned accounts    
    for(Account a : acctsWithOpps) { 
        Opportunity[] relatedOpps = a.Opportunities;  
        // Do some other processing
    }

        }
