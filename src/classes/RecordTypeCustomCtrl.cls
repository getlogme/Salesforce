public class RecordTypeCustomCtrl {
    public List<SelectOption> recTypeList{get;set;}
    public String selRecType{get;set;}
    public RecordTypeCustomCtrl(ApexPages.StandardController controller) {
        recTypeList=new List<SelectOption>();
        Schema.DescribeSObjectResult dsr = Case.SObjectType.getDescribe();
        for(Schema.RecordTypeInfo rti : dsr.getRecordTypeInfos()) {
            if(rti.isAvailable() && rti.getName()!='Master'){
                recTypeList.add(new SelectOption(rti.getRecordTypeId(),rti.getName()));    
            }
        }
    }

}