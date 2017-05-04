global class CurrenceyConverter{
   @future(callout=true)
    public static void getFXRate(){
        system.debug('vikram');
        String USD2EUR;
        String USD2GBP;
        string USD2GBPvalue;
        string USD2EURvalue;
        HttpRequest req = new HttpRequest(); 
        HttpRequest req1 = new HttpRequest(); 
        req.setMethod('GET');
        req1.setMethod('GET');
        req.setHeader('content-type', 'text/xml');
        req1.setHeader('content-type', 'text/xml');
        req.setEndpoint('http://www.google.com/finance/converter?a=1&from=USD&to=GBP');
        req1.setEndpoint('http://www.google.com/finance/converter?a=1&from=USD&to=EUR');
        req.setTimeout(6000); 
        req1.setTimeout(6000); 
        Http h = new Http();
        Http h1 = new Http();   
        HTTPResponse res;
        HTTPResponse res1;     
        try {
            /*if(TestMethodFlag){        
                res = new HTTPResponse(); 
                res1 = new HTTPResponse();  
             }else{*/
                 res = h.send(req); 
                 res1 = h1.send(req1); 
                 //res=new Httpresponse();
                 //res1=new HttpResponse();
                 //res.setHeader('content','<div id=currency_converter_result>1 USD = <span class=bld>0.6212 GBP</span></div>');
                 //res1.setHeader('content','<div id=currency_converter_result>1 USD = <span class=bld>0.7212 GBP</span></div>');
                 
             //}
             System.debug('res'+res);
             System.debug('res1'+res1);

            string totbody = res.getBody();
            string totbody1 = res1.getBody();
            System.debug('totbody  '+totbody);
            System.debug('totbody1  '+totbody1);
            Integer endIndex = totbody.indexOf('</span>'); 
            Integer endIndex1 = totbody1.indexOf('</span>'); 
            Integer startIndex = totbody.indexOf('<span class=bld>');
            Integer startIndex1 = totbody1.indexOf('<span class=bld>');
            string extractString= totbody.substring(startIndex+16 , endIndex); 
            string extractString1= totbody1.substring(startIndex1+16 , endIndex1);
            extractString1 = extractString1.trim(); 
            extractString = extractString.trim();
            USD2GBPvalue =  extractString.substring(0,6);
            USD2EURvalue =  extractString1.substring(0,6);
            USD2GBP = '1 USD = ' + USD2GBPvalue + ' GBP'; 
            USD2EUR = '1 USD = ' + USD2EURvalue + ' EUR';
            system.debug('USD2GBP '+USD2GBP );
            system.debug('USD2EUR '+USD2EUR );
            /*List<Variable__c> conversionList = [SELECT Name, update__c, Value__c FROM Variable__c WHERE Name LIKE 'FX_Rate_%' LIMIT 2];
            List<Variable__c> updateList = new List<Variable__c>();
            system.debug('conversionList '+conversionList );
            for(Variable__c var : conversionList){
                if(var.Name == 'FX_Rate_GBP'){
                    var.update__c = var.update__c+1;
                    var.Value__c = USD2GBPvalue;
                }else{
                    var.update__c = var.update__c+1;
                    var.Value__c = USD2EURvalue;
                }
                updateList.add(var);
            }
            update updateList; */ 
            
           
            
             
         } catch(System.CalloutException e) {
       
         System.debug(e);
        }       
    }
}