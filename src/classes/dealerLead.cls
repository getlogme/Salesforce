public class dealerLead {
public List<SelectOption> dSales{get;set;}
    
    public String selDSales{get;set;}
    //public String selDTechs{get;set;}
    List<Contact_Relationship__c> crs;
    //List<Contact_Relationship__c> crt;
    testNameSpacema__Dealer_Contact__c dc;
    List<Lead> ld;
    public dealerLead(ApexPages.StandardController controller) {
    dc = (Dealer_Contact__c)controller.getRecord();
    ld = [select Id, Dealer__c from Lead where Id =:dc.Lead__c];
    
   
    dc.Dealer__c = ld.get(0).Dealer__c;
    crs=[select contact__r.name from Contact_Relationship__c where Account__c=:ld.get(0).Dealer__c];
    
    dSales=new List<SelectOption>();
        for(Contact_Relationship__c cr:crs){
           dSales.add(new SelectOption(cr.Contact__r.name,cr.Contact__r.name)); 
        }
    

    }
public PageReference saveNew(){
dc.Dealer_Contact__c =selDSales;
insert dc;
testNameSpacema__Dealer_Contact__c dc1=new testNameSpacema__Dealer_Contact__c();
dc1.Lead__c = dc.Lead__c;
dc1.Dealer__c= dc.Dealer__c;
insert dc1;
string Id = dc1.Id;
dealerLead dl = new dealerLead(new ApexPages.StandardController(dc1));
PageReference PR = new PageReference('/apex/dealerLead');
//PR.setRedirect(true);
return PR;
}
public PageReference save(){
dc.Dealer_Contact__c =selDSales;
insert dc;
return new ApexPages.StandardController(ld.get(0)).view();
}


}