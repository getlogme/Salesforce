public class StudentDetailsController{
    public PageReference updateSingleRow() {
        return null;
    }




public boolean displayPopup {get; set;}
 
    public void closePopup() {
        displayPopup = false;
    }
 
    public void showPopup() {
        System.debug('#################'+name);
        System.debug('#################'+ApexPages.CurrentPage().getParameters().get('name'));
        name=ApexPages.CurrentPage().getParameters().get('name');
        System.debug('#################'+fullName);
        System.debug('#################'+courseName);
        testNameSpacema__Student_Details__c studentDetails= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c where id=:name];
        name=studentDetails.name;
        fullName=studentDetails.testNameSpacema__Student_Name__c;
        courseName=studentDetails.testNameSpacema__Course_Name__c;
    
        displayPopup = true;
    }







public StudentDetailsController(){
studentDetailsM();
studentDetailsM1();

}

public List<testNameSpacema__Student_Details__c> studentDetails{get;set;}
public List<testNameSpacema__Student_Details__c> studentDetails1{get;set;}
public String status{get;set;}
public String allNames{get;set;}
public PageReference updaterecord() {
    System.debug('#################'+name);
    System.debug('#################'+fullName);
    System.debug('#################'+courseName);
    System.debug('#################'+marks);
    System.debug('#################'+grade);
    testNameSpacema__Student_Details__c studentDetails= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c where name =:name];
    studentDetails.testNameSpacema__Student_Name__c=fullName;
    studentDetails.testNameSpacema__Course_Name__c=courseName;
    studentDetails.testNameSpacema__marks__c=marks;
    studentDetails.testNameSpacema__Grade__c=grade;
    update studentDetails;
    displayPopup = false;
    studentDetailsM();

    return null;
}

public PageReference setAllNames(){

return null;
}


public PageReference updateAll() {
        System.debug('#########status########'+status);
         System.debug('#########marks########'+marks);
        System.debug('#########allNames########'+allNames);
                
        String[] arrAllNames=allNames.split('~');
        
        for(String tempName:arrAllNames){
           // String tempName=arrAllNames[i];
             testNameSpacema__Student_Details__c studentDetailsU= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c where name =:tempName];
             //studentDetails.testNameSpacema__Student_Name__c=fullName;
             //studentDetails.testNameSpacema__Course_Name__c=courseName;
              if(marks>0){
                  studentDetailsU.testNameSpacema__marks__c=marks;
              }
             studentDetailsU.testNameSpacema__Grade__c=status;
            update studentDetailsU;
        }
        displayPopup = false;
         studentDetailsM();   
        return null;
    }


    public PageReference save() {
        
        return null;
    }

public String name{get;set;}
public String fullName{get;set;}
public String courseName{get;set;}
public Decimal marks{get;set;}
public String grade{get;set;}

    public PageReference doSave() {
        return null;
    }


    public List<testNameSpacema__Student_Details__c> studentDetailsM(){
       
                        studentDetails= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c ];
    return studentDetails;
    
    }
    public List<testNameSpacema__Student_Details__c> studentDetailsM1(){
       
                        studentDetails1= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c ];
    return studentDetails1;
    
    }

}