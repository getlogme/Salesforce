public class DataListGBSOrg {
                        
        List<testNameSpacema__Consulting_Data__c> GbsDataList;

        public List<testNameSpacema__Consulting_Data__c> getGbsDataList() {
                if(GbsDataList == null) GbsDataList = [select testNameSpacema__Invoice_Approver_Common_Name__c,testNameSpacema__Invoice_Vendor_LONG_Name_SAP__c from testNameSpacema__Consulting_Data__c limit 50];
                return GbsDataList;
        }
}