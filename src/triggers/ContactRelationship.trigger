trigger ContactRelationship on  Contact_Relationship__c(after delete, after insert) {

    

   /* if(trigger.isInsert){

                 

        Set<Id> accIds=new Set<Id>();         

        Set<Id> conIds=new Set<Id>();               

        Set<String> roleName=new Set<String>();              

        for(Contact_Relationship__c cr :trigger.new){             

            accIds.add(cr.Account__c);             

            conIds.add(cr.Contact__c);             

            roleName.add(cr.Role__c);                     

         }        

         List<AccountContactRole> acr=[SELECT Id, AccountId, ContactId, Role FROM  AccountContactRole WHERE AccountId IN :accIds OR ContactId IN :conIds OR Role IN :roleName];        

         Set<String> FormatString = new Set<String>();  

         Set<String> FormatString2 = new Set<String>();      

         for(AccountContactRole acr1 :acr){            

             String temp = acr1.AccountId+''+acr1.ContactId+''+acr1.Role;            

             FormatString.add(temp);             

         }                           

         

         List<AccountContactRole> ContactRoleList    = new List<AccountContactRole>();           

         for(Contact_Relationship__c cr :trigger.new){          

             string temp1 = cr.Account__c+''+cr.Contact__c+''+cr.Role__c;        

             if(!FormatString.contains(temp1)){    

                 if(!FormatString2.contains(temp1)){                                                       

                      AccountContactRole ACRoleobj = new AccountContactRole();                                

                      ACRoleobj.AccountId = cr.Account__c;                                 

                      ACRoleobj.ContactId = cr.Contact__c   ;                                 

                      ACRoleobj.Role = cr.Role__c;                                 

                      ContactRoleList.add(ACRoleobj); 

                      FormatString2.add(temp1);     

                  }         

              }

                                                             

          }                 

          if(!ContactRoleList.isEmpty()){                         

              insert ContactRoleList;                 

          }         

      } */         


         if(trigger.isInsert){ 

         Set<Id> accIds=new Set<Id>();

         Set<Id> conIds=new Set<Id>();      

         Set<String> role=new Set<String>();            

         Map<Id,AccountContactRole> maprecs=new Map<Id,AccountContactRole>();

         for(Contact_Relationship__c cr :trigger.new){

             accIds.add(cr.Account__c);

             conIds.add(cr.Contact__c);

             role.add(cr.Role__c);

         }

         List<AccountContactRole> acr=[select Id,AccountId,ContactId,Role from  AccountContactRole where AccountId in :accIds OR ContactId in :conIds OR Role in :role ];

         System.debug('acr === '+acr);

         List<AccountContactRole> ContactRoleList = new List<AccountContactRole>();        

         Set<Id> setId = new Set<Id>();        
         Map<Id,Id> contactIds=new Map<Id,Id>();
         Map<Id,Id> accIdsMap=new Map<Id,Id>();
         Map<Id,String> roleMap=new Map<Id,String>();
         for( Contact_Relationship__c cr :trigger.new){

             if(acr!=null && acr.size()>0){ 

                 for(AccountContactRole rl:acr){ 

                         setId.add(cr.Account__c);    

                         setId.add(cr.Contact__c);             

                         System.debug('cr.Account__c ===== '+!setId.contains(rl.AccountId)); 

                         System.debug('cr.Role__c === '+cr.Role__c!=rl.Role);          

                         System.debug('cr.Contact__c === '+!setId.contains(rl.contactId));  

                         

                         if(!setId.contains(rl.AccountId)  && (cr.Role__c!=rl.Role && !cr.Role__c.trim().equals(rl.Role) && !setId.contains(rl.contactId)) ){ 

                             System.debug('in If  when acr nonempty');

                             AccountContactRole ACRoleobj = new AccountContactRole();                

                             ACRoleobj.AccountId = cr.Account__c;                

                             ACRoleobj.ContactId = cr.Contact__c;                

                             ACRoleobj.Role = cr.Role__c;
                             accIdsMap.put(cr.Contact__c,cr.Account__c);                
                             contactIds.put(cr.Contact__c,cr.Contact__c);
                             roleMap.put(cr.Contact__c,cr.Role__c);
                             ContactRoleList.add(ACRoleobj);

                         

                     } 

                 }

             }else{

                   if(ContactRoleList!=null && ContactRoleList.size()>0){
                     setId.add(cr.Account__c);    
                     setId.add(cr.Contact__c); 
                     if(!setId.contains(accIdsMap.get(cr.Contact__c))  && (cr.Role__c!=roleMap.get(cr.Contact__c) && !cr.Role__c.trim().equals(roleMap.get(cr.Contact__c)) && !setId.contains(contactIds.get(cr.Contact__c))) ){                

                             AccountContactRole ACRoleobj = new AccountContactRole();                

                             ACRoleobj.AccountId = cr.Account__c;                

                             ACRoleobj.ContactId = cr.Contact__c;                

                             ACRoleobj.Role = cr.Role__c;
                             accIdsMap.put(cr.Contact__c,cr.Account__c);                
                             contactIds.put(cr.Contact__c,cr.Contact__c);
                             roleMap.put(cr.Contact__c,cr.Role__c);
                             ContactRoleList.add(ACRoleobj);

                          }

                      

                 }else{

                             AccountContactRole ACRoleobj = new AccountContactRole();                

                             ACRoleobj.AccountId = cr.Account__c;                

                             ACRoleobj.ContactId = cr.Contact__c;                

                             ACRoleobj.Role = cr.Role__c;
                             accIdsMap.put(cr.Contact__c,cr.Account__c);                
                             contactIds.put(cr.Contact__c,cr.Contact__c);
                             roleMap.put(cr.Contact__c,cr.Role__c);
                             ContactRoleList.add(ACRoleobj);

                 }

             }                             

         }  

               

         if(!ContactRoleList.isEmpty()){ 

             System.debug('ContactRoleList '+ContactRoleList);           

             insert ContactRoleList;        

         }    

     }

     if(trigger.isDelete){        

         List<AccountContactRole> ContactRoleList = new List<AccountContactRole>();        

         List<AccountContactRole> ContactList2Delete = new List<AccountContactRole>();  
         Set<Id> ContactSet2Delete = new Set<Id>();      

         Set<Id> AccID = new Set<Id>();        

         Set<Id> ConID = new Set<Id>();       

         for( Contact_Relationship__c cr :trigger.old){            

             AccID.add(cr.Account__c);            

             ConID.add(cr.Contact__c);                    

         }        

         ContactRoleList = [SELECT Id, AccountId, ContactId, Role FROM AccountContactRole WHERE AccountId IN :AccID AND ContactId IN :ConID];         

         for(Contact_Relationship__c cr :trigger.old){            

             for(AccountContactRole ACR :ContactRoleList){                

                 if((cr.Account__c== ACR.AccountId) && (cr.Contact__c== ACR.ContactId) ){                    

                     if(cr.Role__c== ACR.Role){                        

                         //ContactList2Delete.add(ACR);                         
                         ContactSet2Delete.add(ACR.Id); 
                     }                                    

                 }            

             }        

         }        
    ContactList2Delete =[select Id from AccountContactRole where Id in :ContactSet2Delete];
         if(!ContactList2Delete.isEmpty()){            

         delete ContactList2Delete;        

         }           

     }    

}