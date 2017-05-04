public class exampleCon {
    String uname;
    public List<testNameSpacema__Student_Details__c> exportexcel{get;set;}
    public String getUsername() {
        return uname;
    }
            
    public PageReference sayHello() {
        uname = UserInfo.getUsername();
        return null;
    }
            
    public void setState(String n) {
        state = n;
    }
            
    public String getState() {
        return state;
    }
            
    public PageReference methodOne() {
        return null;
    }
    public PageReference incrementCounter() {
        count++;
        return null;
    }
                        
    public Integer getCount() {
        return count;
    }
     
    Integer count=0;   
    private String state = 'no';
    
    public PageReference exporttocsv(){
        exportexcel=[select name,id from testNameSpacema__Student_Details__c];
        PageReference pageRef= new PageReference('/apex/ExportDetails');
       pageRef.setredirect(false);
       return pageRef;
    }    
}