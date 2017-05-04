public class LiaisonTools{
    
    //            Map<UserId, Map<AccountId, RoleName>>
    public Static Map<Id, Map<Id, String>> GetAllUsersAndTheirAssignedAccounts(){
        
        System.debug('Start GetAllUsersAndTheirAssignedAccounts');
        
        integer queries=0;
        Map<Id, Map<Id, String>> mapToReturn = new Map<Id, Map<Id, String>>();
        Map<Id, String> accountAndRoleMap;
        List<User> Users = [Select Id ,Mercury_User_ID__c, LastName From User];
        queries++;
        for(User u : Users){                    
            List<Liaison__c> Liaisons = [Select l.LiasonID__c, l.UserID__c, l.testNameSpacema__Liason_For__c, l.Id, l.Account__c 
                                    From Liaison__c l where l.UserID__r.UserID__c = :u.Mercury_User_ID__c];
                                    
                                    queries++;
                                    
                                    System.debug('Number fo queries for ' + u.LastName + ':' + queries);
                                    
            accountAndRoleMap = new Map<Id, String>();                                  
            for(Liaison__c l : Liaisons){               
                accountAndRoleMap.put(l.Account__c, l.testNameSpacema__Liason_For__c);                        
            }                       
            if (accountAndRoleMap.size()>0) {
                 System.debug(accountAndRoleMap.Size());
                 mapToReturn.put(u.id, accountAndRoleMap);
            }                               
        }
         System.debug('Number fo queries=' + queries);
         System.debug('End GetAllUsersAndTheirAssignedAccounts');
        return mapToReturn;
    }
    
    public static boolean AccountCanHaveThisLiaisonAssigned(User u, Id liaisonId, Id accountId, 
                                                            Map<Id, Map<Id, String>> MapOfUsersAndAccountsAndRoles, 
                                                            string currentRole){
        //if this is a developer liaison type, make sure there is no existing
        //dealer relationship for this account          
        if (currentRole.equals(Constants.DEALER)){
            return true;
        }
                 
        for(Id AccountsAndRolesPerUserKey : MapOfUsersAndAccountsAndRoles.keySet()){
            if (AccountsAndRolesPerUserKey!=u.Id){
                Map<Id, String> collectionOfRolesForAccount = MapOfUsersAndAccountsAndRoles.get(AccountsAndRolesPerUserKey);
                String roleForAccount = collectionOfRolesForAccount.get(accountId);
                if (roleForAccount.equals(Constants.DEALER)) return false;
            }
            //List<String> RolesForAccount = AccountsAndRolesPerUser.get(accountId);
            //System.debug('RolesForAccount-->' + RolesForAccount.Length());
        }
        //Map<Id, String> AccountsForUser = MapOfUsersAndAccountsAndRoles.get(u.Id);
        
        return true;
               
       
       /*
        List<Liaison__c> liasons = [select UserID__c, testNameSpacema__Liason_For__c, Id, Account__c 
                                    from Liaison__c where Account__c=:accountId 
                                    and testNameSpacema__Liason_For__c= :Constants.DEALER and Id<> :liaisonId];
        if (liasons==null){                  
            return true;
        }
        else 
        {
            for(Liaison__c l : liasons){
                //if (l.testNameSpacema__Liason_For__c.equals(Constants.DEALER) && liaisonId <> l.Id )
                //if (liaisonId <> l.Id )
                //{
                    //Get the Mercury ID
                    MPS_User__c  mpsUser =[Select UserID__c from MPS_User__c where Id = :l.UserID__c];
                                    
                    System.debug('u.Mercury_User_ID__c=' + u.Mercury_User_ID__c + ' mpsUser.UserID__c=' + mpsUser.UserID__c);                                   
                                    
                    if (mpsUser != null && u.Mercury_User_ID__c<>mpsUser.UserID__c)
                    {                                               
                        Integer userEntries = [Select count() from User where Mercury_User_ID__c= :mpsUser.UserID__c];
                        
                        if (userEntries > 0)                        
                        {
                            //already an entry for a dealer                     
                            return false;                           
                        }                       
                    }
                //}
            }
        }       
        
        return true;                 
        
        */
                /*
        Liaison__c liason = [select testNameSpacema__Liason_For__c, Liason_Type_Formula__c, Id, Account__c from Liaison__c where Id=:liaisonId];
        if (liason==null || liason.testNameSpacema__Liason_For__c.equals(Constants.DEALER)){
            return true;
        }
        */
        
             
        /*
        //non-dealer liaison - see if there is a dealer liaison for this acct            
        List<Liaison__c> dealerLiasons = 
            [select UserID__c from Liaison__c where Account__c=:liason.Account__c and
            testNameSpacema__Liason_For__c=:Constants.DEALER];
                                    
        if (dealerLiasons.Size() > 0){
            List<String> liaisonUserIDs = new List<string>();
            for(Liaison__c l : dealerLiasons){
                MPS_User__c mpsUser = [select UserID__c from MPS_User__c where Id=:l.UserID__c];
                liaisonUserIDs.Add(mpsUser.UserID__c);
            }                       
            
            //there is a dealer relationship - verify the user is actually in the system                   
            List<user> users = [Select  Id from user where  Mercury_User_ID__c in :liaisonUserIDs];
            if (users.Size()>0){
                //There is a SalesForce user that is a primary Dealer Liaison!              
                return false;
            }
        }
        */
        
        return true;
    }
}