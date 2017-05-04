public class CallWebService{

public List<testNameSpacema__TIPWebData__c> invokeService{
    get{ 
        System.debug('####Start the web service Method '+System.now()); 
        WebServiceStub.Service1Soap serviceObject = new WebServiceStub.Service1Soap();
        serviceObject.timeout_x = 10000;
        System.debug('####Start the web service Call '+System.now());
        WebServiceStub.Result result = serviceObject.GetData('10');
        System.debug('####End the web service Call '+System.now());
        WebServiceStub.ArrayOfResultObject arrayResult = result.itemList;
        List<testNameSpacema__TIPWebData__c> myList = new List<testNameSpacema__TIPWebData__c>();
        WebServiceStub.ResultObject[] arrayResultObject = arrayResult.ResultObject;
        
        for(WebServiceStub.ResultObject obj:arrayResultObject ){
                testNameSpacema__TIPWebData__c tempObj=new testNameSpacema__TIPWebData__c();
                tempObj.testNameSpacema__Brand_Description__c = obj.BrandDescription;
                tempObj.testNameSpacema__Item_Number__c = obj.ItemNumber;
                tempObj.testNameSpacema__Item_Description__c = obj.ItemDescription;
                tempObj.testNameSpacema__Item_Type__c = obj.ItemType;
                tempObj.testNameSpacema__Item_UPC__c = obj.ItemUPC;
                tempObj.testNameSpacema__MerchandiseCategory__c = obj.MerchandiseCategory;
                tempObj.testNameSpacema__Brand_Code__c = 'Vertex001';
                myList.add(tempObj);        
        }
        return myList;
       }
    set;
}

}