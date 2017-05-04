public class AccountPageBlockController{
    public List<Account> getAccounts(){
        return [select Id,Name from Account limit 10];
    }
    public PageReference save(){
    return null;
    }
    public PageReference cancel(){
    return null;
    }
}