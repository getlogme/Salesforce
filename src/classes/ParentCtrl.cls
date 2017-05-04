public class ParentCtrl{

public Pagereference generateReport(){
ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Downloaded Sucessfully');
ApexPages.addMessage(myMsg);
return null;
}

}