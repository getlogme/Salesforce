public class CheckBoxSelect{
public String allRecs{get;set;}
public List<testNameSpacema__Student_Details__c> listStudents{get;set;}
public CheckBoxSelect(){
listStudents=[select id,name,testNameSpacema__Course_Name__c from testNameSpacema__Student_Details__c];
} 
public void save(){
}

}