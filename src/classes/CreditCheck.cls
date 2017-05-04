public class CreditCheck{
    public String getCreditValue(String dob,String ssn){
        integer creditValue=650;
        String creditType;
        Decimal lowBandValue;
        Decimal highBandValue;
        List<CreditBands__c> lstCreditBands=[select name,id,Credit_Value__c,Credit_Type__c from CreditBands__c];
        for(CreditBands__c cb:lstCreditBands){
         if(cb.name=='Low'){
            lowBandValue=cb.credit_value__c; 
         }else if(cb.name=='High'){
             highBandValue=cb.credit_value__c; 
         }
        }
        if(creditValue<=lowBandValue){
            creditType='Low';
        }else if(creditValue>lowBandValue && creditValue<highBandValue){
            creditType='Mid';
        }else if(creditValue>=highBandValue){
            creditType='High';
        }
        return creditType;
        }
        static testMethod void myTest()
        {
            CreditBands__c[] CreditBandsToCreate = new CreditBands__c[]{};
            for(integer x=0;x<200;x++)
            {
                CreditBands__c CB = new CreditBands__c(name='Low',Credit_Value__c = 100,Credit_type__c='Low'); 
                CreditBandsToCreate.add(CB);
            }
            CreditCheck CC = new CreditCheck();
            cc.getCreditValue('ram','babu');
                         
        }
    }