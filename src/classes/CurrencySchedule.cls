global class CurrencySchedule implements Schedulable
{ 
    global void execute(SchedulableContext SC) 
    { 
        //test
        List<testNameSpacema__CurrencyObj__c>  curList=[select id,testNameSpacema__updatedDate__c from testNameSpacema__CurrencyObj__c];
        if(curList!=null && curList.size()>0){
            testNameSpacema__CurrencyObj__c obj=curList.get(0);
            obj.testNameSpacema__updatedDate__c=Date.today();
            update obj;
        }else{
            testNameSpacema__CurrencyObj__c newObj=new testNameSpacema__CurrencyObj__c();
            newObj.testNameSpacema__updatedDate__c=Date.today();
            insert newObj;
        }
    }
}