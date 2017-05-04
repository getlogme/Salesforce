public class StudentDetPagingCont{
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


    public List<testNameSpacema__Student_Details__c> studentDetails{
        get {
            if(studentDetails == null) {
            studentDetails= [SELECT name, testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__marks__c,testNameSpacema__Grade__c FROM testNameSpacema__Student_Details__c ];
}
return studentDetails;
}
set;
    
    }
}