@isTest
private class AdditionalDirectCostTest{
static testMethod void myUnitTest(){
    testNameSpacema__PLCountry__c plc=new testNameSpacema__PLCountry__c();
    plc.name='Test Country';
    plc.testNameSpacema__CountryIsoCode__c='Test';
    insert plc;
    testNameSpacema__VGE_PL_Country_Summary__c plcs=new testNameSpacema__VGE_PL_Country_Summary__c();
    plcs.testNameSpacema__Bid_Years__c=4;
    plcs.testNameSpacema__VGE_Country__c=plc.id;
    insert plcs;
    //List<testNameSpacema__VGE_PL_Country_Summary__c> cSum=[select id from testNameSpacema__VGE_PL_Country_Summary__c];
    Apexpages.CurrentPage().getParameters().put('Id',plcs.Id);
    
    AdditionalDirectCost adc=new AdditionalDirectCost();
    
        adc.selCoutry=plcs.Id;
    
    adc.connections();
    adc.save();
    adc.cancel();
}
}