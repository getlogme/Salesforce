public class PDF2{
public List<Account> lstStr{get;set;}
public PDF2(){
    lstStr=[select name from account limit 2];
}
}