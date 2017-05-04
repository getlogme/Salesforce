public class testSearch {

    public List<testNameSpacema__Student_Details__c> listofstudobjs{ 
        get; set;
    }
         
    public String name { get; set; } 

    
    public PageReference getResults(){
       String queryName = '%' + name + '%';
       listofstudobjs=[SELECT Name, testNameSpacema__Student_Name__c, testNameSpacema__marks__c,testNameSpacema__Grade__c,testNameSpacema__Course_Name__c FROM testNameSpacema__Student_Details__c where (name like :queryName) and (name like : '%')];
       PageReference obj=new PageReference ('/apex/searchResultsPage');
       obj.setRedirect(false);  
     return obj;
   } 
              
}