public class dataListCon {
                        
        List<Account> accounts;

        public List<Account> getAccounts() {
                if(accounts == null) accounts = [select name from account limit 10];
                return accounts;
        }
}