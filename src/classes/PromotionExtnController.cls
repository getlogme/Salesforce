public class PromotionExtnController {
    public String accId{get;set;}
    public String secondaryAccIds{get;set;}
    public String accName{get;set;}
    public Promotion__c promo{get
    {
        if(promo==null){
            promo=new Promotion__c();
        }else{
            promo=promo;
        }
        return promo;
    }
    set;}
    public PromotionExtnController(ApexPages.StandardController controller) {
        
    }
    
    public PageReference save(){
        promo.Account__c=accId;
        insert promo;
        List<testNameSpacema__AccountPromotion__c> apList=new List<testNameSpacema__AccountPromotion__c>();
        for(String accId:secondaryAccIds.split(';')){
            System.debug('accId : '+accId);
            if(accId!=null && accId!=''){
                testNameSpacema__AccountPromotion__c ap=new testNameSpacema__AccountPromotion__c();
                ap.Account__c=accId;
                ap.Promotion__c=promo.Id;
                apList.add(ap);
            }
            
        }
        insert apList;
        return null;
    }

}