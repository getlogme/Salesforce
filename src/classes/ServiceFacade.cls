public class ServiceFacade{
    public Map<String, Object> serviceCallout(){
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'jsonResponse' LIMIT 1];
        String body = sr.Body.toString();
        //Service callout String jsonresponse=webserviceCallout();
        
        Map<String, Object> resultsMap=(Map<String, Object>) JSON.deserializeUntyped(body);
        return resultsMap;
    }
}