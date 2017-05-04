public class ContractDetails{
String contId;
testNameSpacema__VGE_PL_Iteration__c itObj;
public Date oppDate{get;set;} 
public ContractDetails(Apexpages.StandardController controller){
contId=Apexpages.currentpage().getParameters().get('id');
System.debug('contId === '+contId);
itObj=(testNameSpacema__VGE_PL_Iteration__c )controller.getRecord();
}
public PageReference save(){
if(itObj!=null){
    update itObj;
    
return new Apexpages.StandardController(itObj).view();
}
return null;
}

}