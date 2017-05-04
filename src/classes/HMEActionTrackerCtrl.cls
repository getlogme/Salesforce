public class HMEActionTrackerCtrl {
    public String selHmeAcc{get;set;}
    public String selPrepBy{get;set;}
    public String selDelOwnerList{get;set;}
    public HME_Collaboration_Action_Tracker__c hmeCase{
        get{
        if(hmeCase==null){
            hmecase=new HME_Collaboration_Action_Tracker__c();
            hmeCase.Prepared_by__c=UserInfo.getUserId();
            hmeCase.Date__c=Date.Today();
        }else{
            hmeCase=hmeCase;
        }
        return hmeCase;
        }
        set;
    }
    public List<HMEDeliverable> HMEDeliverableList{get;set;} 
    public HMEActionTrackerCtrl(ApexPages.StandardController controller){
            hmeDeliverableList=new List<HMEDeliverable>();        
            HME_Deliverable__c HMEDeliverable=new HME_Deliverable__c();
            HMEDeliverableList.add(new HMEDeliverable(HMEDeliverable,getOwnerList(),1));
            //se=[select Id,HME_Account_Name__c from HME_Collaboration_Action_Tracker__c where Id=:controller.getRecord().Id];
        
    }
    
    public List<Account> getHmeAccounts(){
        String recTypeId=[select Id from RecordType where SobjectType='Account' and developerName='HME'].Id;
        return [select Id,Name from Account where ownerId=:UserInfo.getUserId() and RecordTypeId=:recTypeId];
    }
    public List<User> getOwnerList(){
        return [select Id,Name from User];
    }
    public List<User> getHlUsers(){
        return [select Id, Name from User];    
    }
    
    public PageReference Save(){
    
    insert hmeCase;
    List<HME_Deliverable__c> insertDeliverables=new List<HME_Deliverable__c>();
    for(HMEDeliverable hd:HMEDeliverableList){
        HME_Deliverable__c hDel=new HME_Deliverable__c();            
        /*if(hd.Name!=null || hd.Name!='' && hd.Date__c!=null && hd.Owner__c!=null){            
            hd.OwnerId=hd.Owner__c;
            hd.HME_Collaboration_Action_Tracker__c=hmeCase.Id;
            insertDeliverables.add(hd);
        }else if(hd.Name==null || hd.Name==''){
                
        }else if(hd.Date__c==null){
            
        }*/
        //insertDeliverables.add(hd);
    }
    
    insert insertDeliverables;
    return new PageReference('/'+hmeCase.Id);
    }
    public PageReference addRow(){
            HME_Deliverable__c HMEDeliverable=new HME_Deliverable__c();
            HMEDeliverableList.add(new HMEDeliverable(HMEDeliverable,getOwnerList(),HMEDeliverableList.size()+1));
            return null;
    }
    
    public PageReference removeRow(){
    
           HMEDeliverableList.remove(HMEDeliverableList.size()-1);
           return null;
    }
    
    public PageReference cancel(){       
        PageReference pageRef=null;
        pageref = new PageReference('/a2f?fcf=00Bf0000000MUVb');
        pageRef.setredirect(true);
        return pageRef;
    }
    
    class HMEDeliverable{
     public List<User> ownerList{get;set;}
     public HME_Deliverable__c hmeDelObj{get;set;}
     public Integer recNum{get;set;} 
     
     public HMEDeliverable(HME_Deliverable__c hmeDelObj,List<User> ownerList,Integer i){
         this.hmeDelObj=hmeDelObj;
         this.OwnerList=ownerList;
         this.recNum=i;
     }   
    
    
    }
}