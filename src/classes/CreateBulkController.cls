public class CreateBulkController{
    
    public List<SiteWrapper> conList{get;set;}
    public List<SiteWrapper> conMemberList{get;set;}
    public String accId;
    public CreateBulkController(){
        accId=Apexpages.currentpage().getParameters().get('accId');        
        conList=new List<SiteWrapper>();
        conMemberList=new List<SiteWrapper>();
        for(testNameSpacema__Members__c m:[select Name,testNameSpacema__Account__c from testNameSpacema__Members__c where testNameSpacema__Account__c=:accId]){
            Contact c=new Contact(AccountId=accId,LastName='Test',Account__c=m.testNameSpacema__Account__c);
            conMemberList.add(new SiteWrapper(false,c));    
        }
        conList.add(new SiteWrapper(false,new Contact(AccountId=accId,LastName='Test')));    
    }
    
    public PageReference addNewAccount(){
        conList.add(new SiteWrapper(false,new Contact(AccountId=accId,LastName='Test')));
        return null;     
    }
    
    public PageReference saveAccounts(){
        List<Contact> insertContactList=new List<Contact>();
        delete [select Id from contact where AccountId=:accId];
        for(SiteWrapper sw:conList){
            if(sw.selected){
                insertContactList.add(sw.cont);  
            }  
        }
        
        for(SiteWrapper sw:conMemberList){
            if(sw.selected){
                insertContactList.add(sw.cont);  
            }  
        }
        
        insert insertContactList;
        return new PageReference('/'+accId);   
    }
    
    public class SiteWrapper{
        public Boolean selected{get;set;}
        public Contact cont{get;set;}
        public SiteWrapper(){}
        public SiteWrapper(Boolean selected,Contact cont){
            this.selected=selected;
            this.cont=cont;        
        } 
    }
}