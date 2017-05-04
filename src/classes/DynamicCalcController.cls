public class DynamicCalcController {
       
public DynamicCalcController(){
dynamicCalc();
}
public Double updatedVal{get;set;}
public Double originalVal{get;set;}
public String fieldName{get;set;}
public List<testNameSpacema__Dynamic_Calc__c> details{get;set;}


public List<testNameSpacema__Dynamic_Calc__c> dynamicCalc(){       
                        details= [SELECT testNameSpacema__Quantity__c,testNameSpacema__Price__c,testNameSpacema__Total__c FROM testNameSpacema__Dynamic_Calc__c ];
    return details;
    
    }
    
public PageReference updateRec(){
//System.debug('###############fieldName#####'+Apexpages.currentPage().getParameters().get('fieldName'));
//System.debug('###############originalVal#####'+Apexpages.currentPage().getParameters().get('originalVal'));
//System.debug('###############updatedVal#####'+Apexpages.currentPage().getParameters().get('updatedVal'));

System.debug('###############fieldName#####'+fieldName);
System.debug('###############originalVal#####'+originalVal);
System.debug('###############updatedVal#####'+updatedVal);
Double[] arrOriginalVal=new Double[1];
arrOriginalVal[0]=originalVal;
 //testNameSpacema__Dynamic_Calc__c detailsU = [SELECT testNameSpacema__Quantity__c,testNameSpacema__Price__c,testNameSpacema__Total__c FROM testNameSpacema__Dynamic_Calc__c where fieldName : originalVal];
testNameSpacema__Dynamic_Calc__c detailsU=null;
for(Double tempVal :arrOriginalVal){
    if(fieldName.equals('testNameSpacema__Quantity__c')){
              detailsU = [SELECT testNameSpacema__Quantity__c,testNameSpacema__Price__c,testNameSpacema__Total__c FROM testNameSpacema__Dynamic_Calc__c where testNameSpacema__Quantity__c =: tempVal ];
    }else{
             detailsU = [SELECT testNameSpacema__Quantity__c,testNameSpacema__Price__c,testNameSpacema__Total__c FROM testNameSpacema__Dynamic_Calc__c where testNameSpacema__Price__c =: tempVal ];
    }
    if(detailsU!=null){
        if(fieldName.equals('testNameSpacema__Quantity__c')){
        detailsU.testNameSpacema__Quantity__c=updatedVal;
        }else if(fieldName.equals('testNameSpacema__Price__c')){
        detailsU.testNameSpacema__Price__c=updatedVal;
        }
        update detailsU;
    }
}
dynamicCalc();
return null;
}
}