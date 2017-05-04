public class MentorMyStudentsController {
   public String lUser=UserInfo.getUserID();
   public transient List<Account> StdList {get;set;}
   public List<SelectOption> courseCodesList{get;set;}
   public String selCourseCode{get;set;}  
   public MentorMyStudentsController(){
                
            //StdList=studentListData();
            
         
   } 
    public List<Account> studentListData(){
         List<Account> lstStudents=[select Id,Name from Account];    
         return lstStudents;    
    }
    
    public PageReference crsStudentListData(){
        
            System.debug('selCourseCode => '+selCourseCode);
            if(selCourseCode!=null){
            StdList=[select Id,Name,AccountNumber,OwnerId,Phone,testNameSpacema__Active__c,testNameSpacema__UpsellOpportunity__c,testNameSpacema__SLASerialNumber__c,testNameSpacema__SLAExpirationDate__c,testNameSpacema__SLA__c,testNameSpacema__NumberofLocations__c,testNameSpacema__Download_Export_Control_Check_Date__c from Account where testNameSpacema__Status__c=:selCourseCode]; 
            }
            System.debug('crsStdList => '+StdList);
            if(StdList==null || StdList.size()==0){
               ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'No Student record associated with your Account'));
            }
            return null;
    }

       
    
}