public class SendEmail1 {
    public List<SelectOption> orgWideEmailAddress{get;set;}
    public String selFrom{get;set;}
    public SendEmail1(){
        orgWideEmailAddress=new List<SelectOption>();
        for(OrgWideEmailAddress owa : [select id, Address, DisplayName from OrgWideEmailAddress]){
            orgWideEmailAddress.add(new SelectOption(owa.Address,owa.Address));    
        }
    }

    public PageReference cancel() {
        return null;
    }


    public PageReference send() {
        return null;
    }


    public PageReference save() {
        return null;
    }

}