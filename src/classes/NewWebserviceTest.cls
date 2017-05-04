public class NewWebserviceTest{
public String respString{get;set;}

public NewWebserviceTest(){
    NewWebservice.NewWebservicePortTypeSoapPort port=new  NewWebservice.NewWebservicePortTypeSoapPort();
    respString=port.getWelcomeString('vikram');
}

}