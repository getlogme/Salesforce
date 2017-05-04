trigger updPrimaryDealerDev on Liaison__c (after insert,after update) {

Map<Id,testNameSpacema__MPS_User__c> mpsUsers=new Map<Id,testNameSpacema__MPS_User__c>();
Set<Id> mpsUsrsSet=new Set<Id>();
Set<Id> mpsUsrSet=new Set<Id>();
for(Liaison__c l:Trigger.new){
 mpsUsrsSet.add(l.testNameSpacema__UserID__c);
}
for(testNameSpacema__MPS_User__c mps:[select Id,testNameSpacema__UserID__c from testNameSpacema__MPS_User__c where Id in :mpsUsrsSet ]){
mpsUsers.put(mps.Id,mps);
mpsUsrSet.add(mps.testNameSpacema__UserID__c);
}

}