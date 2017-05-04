public class BrowseTest{
public Blob aFile{get;set;}
public List<AccData> accData{get;set;}
public PageReference extract(){
String str=aFile.toString();
String[] arrStr=str.split('\n');
accData=new List<AccData>();
for(String st:arrStr){
    String[] arrSt=st.split(',');
    AccData ad=new AccData();
    ad.custId=arrSt[0];
    ad.accName=arrSt[1];
    ad.billingStreet=arrSt[2];
    ad.postalCode=arrSt[3];
    ad.billingCity=arrSt[4];
    ad.phone=arrSt[5];
    ad.fax=arrSt[6];
    ad.brick=arrSt[7];
    ad.owner=arrSt[8];
    ad.status=arrSt[9];
    accData.add(ad);
   
}
accData.remove(0);
System.debug(str);
return null;

}
public class AccData{
    public String custId{get;set;}
    public String accName{get;set;}
    public String billingStreet{get;set;}
    public String postalCode{get;set;}
    public String billingCity{get;set;}
    public String phone{get;set;}
    public String fax{get;set;}
    public String brick{get;set;}
    public String owner{get;set;}
    public String status{get;set;}
}
}