trigger AccountOwnerUpdate on Liaison__c (after insert,after update) {
Map<Id,Id> accMpsDevMap=new Map<Id,Id>();
Map<Id,Id> accMpsDlrMap=new Map<Id,Id>();
for(Liaison__c l:Trigger.new){
     if(l.testNameSpacema__Liason_For__c.equals(Constants.DEVELOPER)&& l.Liason_Type_Formula__c.equals(Constants.PRIMARYLIAISON)){
         accMpsDevMap.put(l.Account__c,l.UserID__c);
     }
     if(l.testNameSpacema__Liason_For__c.equals(Constants.DEALER)&& l.Liason_Type_Formula__c.equals(Constants.PRIMARYLIAISON)){
         accMpsDlrMap.put(l.Account__c,l.UserID__c);
     }
}
List<Id> mpsUserIdslstDev=accMpsDevMap.values();
List<Id> mpsUserIdslstDlr=accMpsDlrMap.values();
Set<Id> setMpsUsrIdDev=new Set<Id>();
Set<Id> setMpsUsrIdDlr=new Set<Id>();
for(Id i:mpsUserIdslstDev){
   setMpsUsrIdDev.add(i);     
}

for(Id i:mpsUserIdslstDlr){
   setMpsUsrIdDlr.add(i);     
}
Map<Id,String> mpsUsrIdsDev=new Map<Id,String>();
Map<Id,String> mpsUsrIdsDlr=new Map<Id,String>();
Set<String> setUsrIdDev=new Set<String>();
Set<String> setUsrIdDlr=new Set<String>();
List<MPS_User__c> lstMPSUsers=[select Id,UserID__c from MPS_User__c where Id in :setMpsUsrIdDev];
for(MPS_User__c mpu:lstMPSUsers){
   mpsUsrIdsDev.put(mpu.Id,mpu.UserID__c);
   setUsrIdDev.add(mpu.UserID__c);     
}

List<MPS_User__c> lstMPSUsersDlrs=[select Id,UserID__c from MPS_User__c where Id in :setMpsUsrIdDlr];
for(MPS_User__c mpu:lstMPSUsersDlrs){
   mpsUsrIdsDlr.put(mpu.Id,mpu.UserID__c);
   setUsrIdDlr.add(mpu.UserID__c);     
}
List <User> usersDev = [Select u.Mercury_User_ID__c, u.Id From User u where Mercury_User_ID__c in : setUsrIdDev];
List <User> usersDlr = [Select u.Mercury_User_ID__c, u.Id From User u where Mercury_User_ID__c in : setUsrIdDlr];
Map<String,Id> devUserMap=new Map<String,Id>();
Map<String,Id> dlrUserMap=new Map<String,Id>();
for(User u:usersDev){
  devUserMap.put(u.Mercury_User_ID__c, u.Id);  
}

for(User u:usersDlr ){
  dlrUserMap.put(u.Mercury_User_ID__c, u.Id);  
}

List<Account> devAcc=[select Id,OwnerId from Account where Id in:accMpsDevMap.keyset()];
List<Account> dlrAcc=[select Id,OwnerId from Account where Id in:accMpsDlrMap.keyset()];

List<Liaison__c> lsLiaisonsDlr=[select Id,Account__c,testNameSpacema__Liason_For__c,Liason_Type_Formula__c from Liaison__c where Account__c in :accMpsDlrMap.keyset() and testNameSpacema__Liason_For__c=:Constants.DEALER and Liason_Type_Formula__c =:Constants.PRIMARYLIAISON];
List<Liaison__c> lsLiaisonsDev=[select Id,Account__c,testNameSpacema__Liason_For__c,Liason_Type_Formula__c from Liaison__c where Account__c in :accMpsDevMap.keyset() and testNameSpacema__Liason_For__c=:Constants.DEVELOPER and Liason_Type_Formula__c =:Constants.PRIMARYLIAISON];
Map<Id,Liaison__c> devExistLsMap=new Map<Id,Liaison__c>();
Map<Id,Liaison__c> dlrExistLsMap=new Map<Id,Liaison__c>();
for(Liaison__c el: lsLiaisonsDev){
    devExistLsMap.put(el.Account__c,el);
}
for(Liaison__c el: lsLiaisonsDlr){
    dlrExistLsMap.put(el.Account__c,el);
}

for(Account a:devAcc){
    if(dlrExistLsMap!=null && dlrExistLsMap.size()>0 && dlrExistLsMap.get(a.Id)==null){
        if(devUserMap.get(mpsUsrIdsDev.get(accMpsDevMap.get(a.Id)))!=null){
            a.OwnerId=devUserMap.get(mpsUsrIdsDev.get(accMpsDevMap.get(a.Id)));
        }
    }else{
        if(devUserMap.get(mpsUsrIdsDev.get(accMpsDevMap.get(a.Id)))!=null){
            a.OwnerId=devUserMap.get(mpsUsrIdsDev.get(accMpsDevMap.get(a.Id)));
        }
    }
}
if(devAcc!=null && devAcc.size()>0){
    update devAcc;
}
for(Account a:dlrAcc){
    if(dlrUserMap.get(mpsUsrIdsDlr.get(accMpsDlrMap.get(a.Id)))!=null){
        a.OwnerId=dlrUserMap.get(mpsUsrIdsDlr.get(accMpsDlrMap.get(a.Id)));
    }
}
if(dlrAcc!=null && dlrAcc.size()>0){
    update dlrAcc;
}



}