public class CreditValidation{
public String fName{get;set;}
public String mi{get;set;}
public String lName{get;set;}
public String company{get;set;}
public String street{get;set;}
public String city{get;set;}
public String state{get;set;}
public String zip{get;set;}
public String dob{get;set;}
public String ssn{get;set;}
public String productId{get;set;}
public String existingAccID{get;set;}
public Boolean noCreditCheck{get;set;}
public String localSupportNumber{get;set;}
public CreditValidation(){
}
public PageReference next(){      
    PageReference pf=new PageReference('/apex/TestPage');
    system.debug('existingAccID =========== '+existingAccID);
    
    return pf;
}
public PageReference back(){
String url = Page.TestPage.getUrl();
        return new PageReference(url);

}
public PageReference cancel(){
String url= Page.TestPage.getURL();
        
        return new PageReference(url);
}
}