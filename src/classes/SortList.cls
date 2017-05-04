public class SortList{
public List<testNameSpacema__Student_Details__c> unOrderList{get;set;}
public SortList(){
unOrderList=[select name,createdDate from testNameSpacema__Student_Details__c order by name Asc];
system.debug('unOrderList====== '+unOrderList);
}

}