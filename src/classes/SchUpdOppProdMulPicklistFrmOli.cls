global class SchUpdOppProdMulPicklistFrmOli  implements Schedulable {
 
   global void execute(SchedulableContext sc) {
      String qr='select Id,Products__c from opportunity'; 
      UpdOppProdMulPicklistFrmOli  upmoli = new UpdOppProdMulPicklistFrmOli(qr); 
      database.executebatch(upmoli,10);
   }
   
}