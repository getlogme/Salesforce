public class TestWrapperController{
public Bean sBean{
get{
if(sBean==null){
    sBean=new Bean();
}
return sBean;
}
set;
}
public TestWrapperController(){
testNameSpacema__Student_Details__c sObj=[select testNameSpacema__Student_Name__c,testNameSpacema__Course_Name__c,testNameSpacema__Grade__c from testNameSpacema__Student_Details__c limit 1 ];
sBean.sName=sObj.testNameSpacema__Student_Name__c;
sBean.cName=sObj.testNameSpacema__Course_Name__c;
sBean.grade=sObj.testNameSpacema__Grade__c;
}

}