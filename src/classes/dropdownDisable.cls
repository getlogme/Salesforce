public class dropdownDisable{
public List<testNameSpacema__Student_Details__c> stdDetails{get;set;}
public dropdownDisable(){
records();
}
public void records(){
stdDetails=[select id,name,testNameSpacema__marks__c,testNameSpacema__Grade__c from testNameSpacema__Student_Details__c];
}
}