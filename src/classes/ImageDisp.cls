public class ImageDisp{
public List<Product__c> prodList{get;set;}
public ImageDisp(){
    //prodList=[select id,name,testNameSpacema__Image__c from Product__c];
    System.debug('prodList ==> '+prodList);
}

}