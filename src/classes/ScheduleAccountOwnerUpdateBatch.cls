global class ScheduleAccountOwnerUpdateBatch implements Schedulable {
  
  global void execute(SchedulableContext SC) {
     Database.executeBatch(new AccountOwnerUpdate(),10);
  }  
}