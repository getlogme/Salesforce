public class SRControllerExt {
    public String searchTxt{get;set;}
    public List<Document> docList{get;set;}
    public SRControllerExt(ApexPages.StandardController controller) {
        docList=new List<Document>();
    }
    public PageReference search(){
    System.debug('searchTxt : '+searchTxt);
    String keyword='%'+searchTxt+'%';
    ID workspaceId = [SELECT Id FROM ContentWorkspace WHERE Name = 'SR Templates'][0].Id;
    for(ContentVersion cv:[SELECT Title,testNameSpacema__Keywords__c FROM ContentVersion WHERE ContentDocument.ParentId = :workspaceId and testNameSpacema__Keywords__c like :keyword])
    {
         Document doc=new Document();
         doc.selected=false;
         doc.title=cv.Title;
         docList.add(doc);   
    }
    
    return null;
    }
    
    public class Document{
        public Boolean selected{get;set;}
        public String title{get;set;}
        
    }
}