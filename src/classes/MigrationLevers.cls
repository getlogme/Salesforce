public class MigrationLevers{
public List<SelectOption> coutries{get;set;}
public String selCoutry{get;set;}
public List<Connection> connection{get;set;}
public List<Connection> ySummary{get;set;}


public MigrationLevers(){
coutries=getCountriesList();
}
public List<SelectOption> getCountriesList(){
List<SelectOption> lstCountries=new List<SelectOption>();
List<testNameSpacema__VGE_PL_Country_Summary__c> lstSummary=[select testNameSpacema__VGE_Country__c from testNameSpacema__VGE_PL_Country_Summary__c];
System.debug(lstSummary);
Set<Id> IdSet=new Set<Id>();
for(testNameSpacema__VGE_PL_Country_Summary__c ts:lstSummary){
IdSet.add(ts.testNameSpacema__VGE_Country__c);
}
List<testNameSpacema__PLCountry__c> lisCountry=[select name from testNameSpacema__PLCountry__c where id in :IdSet];
for(testNameSpacema__PLCountry__c plc:lisCountry){
    lstCountries.add(new SelectOption(plc.name,plc.name));
}
return lstCountries;
}

public PageReference connections(){
if(selCoutry!='Select Country'){
String conId=[select Id from testNameSpacema__PLCountry__c where name= :selCoutry].Id;
List<testNameSpacema__VGE_PL_Country_Summary__c> listSummary=[select testNameSpacema__Bid_Years__c,testNameSpacema__BB_CTNs_New__c,testNameSpacema__BB_CTNs_Existing__c,testNameSpacema__HH_CTNs_New__c,testNameSpacema__HH_CTNs_Existing__c,testNameSpacema__MCC_CTNs_New__c,testNameSpacema__MCC_CTNs_Existing__c,testNameSpacema__Voice_CTNs_Existing__c,testNameSpacema__Voice_CTNs_New__c,testNameSpacema__VGE_Country__c from testNameSpacema__VGE_PL_Country_Summary__c where testNameSpacema__VGE_Country__c=:conId];
connection=new List<Connection>();
Connection newCon=new Connection();
Connection exCon=new Connection();
newCon.Connection='New Connections';
exCon.Connection='Existing Connections';
Double nvoice=0.0;
Double nhh=0.0;
Double nbb=0.0;
Double nmcc=0.0;
Double evoice=0.0;
Double ehh=0.0;
Double ebb=0.0;
Double emcc=0.0;
Integer bidYears=Integer.valueOf(listSummary.get(0).testNameSpacema__Bid_Years__c);
for(testNameSpacema__VGE_PL_Country_Summary__c cur:listSummary){
   nvoice=nvoice+cur.testNameSpacema__Voice_CTNs_New__c;
   evoice=evoice+cur.testNameSpacema__Voice_CTNs_Existing__c;
   nhh=nhh+cur.testNameSpacema__HH_CTNs_New__c;
   ehh=ehh+cur.testNameSpacema__HH_CTNs_Existing__c;
   nbb=nbb+cur.testNameSpacema__BB_CTNs_New__c;
   ebb=ebb+cur.testNameSpacema__BB_CTNs_Existing__c;
   nmcc=nmcc+cur.testNameSpacema__MCC_CTNs_New__c;
   emcc=emcc+cur.testNameSpacema__MCC_CTNs_Existing__c;
 }
 newCon.voice=nvoice;
 newCon.hh=nhh;
 newCon.bb=nbb;
 newCon.mcc=nmcc;
 exCon.voice=evoice;
 exCon.hh=ehh;
 exCon.bb=ebb;
 exCon.mcc=emcc;
connection.add(newCon);
connection.add(exCon);
ySummary=null;
ySummary=new List<Connection>();
for(Integer i=0;i<bidYears;i++){
    Connection con=new Connection();
    con.year=i+1;
    ySummary.add(con);
    Connection con1=new Connection();
    con1.quarter=1;
    con1.year=i+1;
    ySummary.add(con1);
    Connection con2=new Connection();
    con2.quarter=2;
    con2.year=i+1;
    ySummary.add(con2);
    Connection con3=new Connection();
    con3.quarter=3;
    con3.year=i+1;
    ySummary.add(con3);
    Connection con4=new Connection();
    con4.quarter=4;
    con4.year=i+1;
    ySummary.add(con4);
}
System.debug('ySummary === '+ySummary);
}

return null;
}
public PageReference save(){
System.debug('ySummary in save == '+ySummary);
System.debug('ySummary in save Size== '+ySummary.size());
String countryId=null;
if(selCoutry!='Select Country'){
     countryId=[select Id from testNameSpacema__PLCountry__c where name= :selCoutry].Id;
}
for(integer i=0;i<ySummary.size();i++){
    System.debug('ysummarymadhu ' + i + '  ' + ySummary.get(i));    
}
Set<Integer> setYears=new Set<Integer>();
for(Connection con:ySummary){
    //if((con.vquarter1!=null && con.vquarter1!=0)||(con.hhquarter1!=null && con.hhquarter1!=0)||(con.bbquarter1!=null && con.bbquarter1!=0)||(con.mccquarter1!=null && con.mccquarter1!=0) ){
        setYears.add(con.year);
    //}
    if(con.vquarter1==0){
        con.vquarter1=null;
    }
    if(con.hhquarter1==0){
        con.hhquarter1=null;
    }
    if(con.bbquarter1==0){
        con.bbquarter1=null;
    }
    if(con.mccquarter1==0){
        con.mccquarter1=null;
    }
}
System.debug('countryId  ====== '+countryId );
List<testNameSpacema__VGE_PL_Yearly_Product_Summary__c> yprodSummary=[select testNameSpacema__P_L_Product__c,testNameSpacema__Month_1_Connections__c,testNameSpacema__Month_2_Connections__c,testNameSpacema__Month_3_Connections__c,testNameSpacema__Month_4_Connections__c,testNameSpacema__Month_5_Connections__c,testNameSpacema__Month_6_Connections__c,   testNameSpacema__Month_7_Connections__c,testNameSpacema__Month_8_Connections__c,testNameSpacema__Month_9_Connections__c,testNameSpacema__Year__c,testNameSpacema__Month_10_Connections__c,testNameSpacema__Month_11_Connections__c,testNameSpacema__Month_12_Connections__c from testNameSpacema__VGE_PL_Yearly_Product_Summary__c  where testNameSpacema__Year__c in :setYears and testNameSpacema__LookupVGECountry__c =:countryId ];
Integer carriedCons=null;
for(testNameSpacema__VGE_PL_Yearly_Product_Summary__c ypsum:yprodSummary){
for(Connection con:ySummary){
    
        if(ypsum.testNameSpacema__P_L_Product__c!=null && ypsum.testNameSpacema__P_L_Product__c=='Handheld' && ypsum.testNameSpacema__Year__c==con.year){
            if(con.quarter==1 && con.hhquarter1!=null){
                if(ypsum.testNameSpacema__Month_1_Connections__c==null){
                    ypsum.testNameSpacema__Month_1_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=con.hhquarter1;
                carriedCons=Integer.valueof(ypsum.testNameSpacema__Month_2_Connections__c);
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }else{
                if(ypsum.testNameSpacema__Year__c>1){
                    ypsum.testNameSpacema__Month_1_Connections__c=carriedCons;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }
            if(con.quarter==2 && con.hhquarter1!=null){
                if(ypsum.testNameSpacema__Month_4_Connections__c==null){
                    ypsum.testNameSpacema__Month_4_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_5_Connections__c=con.hhquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_5_Connections__c);
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }else{
                ypsum.testNameSpacema__Month_5_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }
            if(con.quarter==3 && con.hhquarter1!=null){
                if(ypsum.testNameSpacema__Month_7_Connections__c==null){
                    ypsum.testNameSpacema__Month_7_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_8_Connections__c=con.hhquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_8_Connections__c);
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }else{
                
                ypsum.testNameSpacema__Month_8_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }
            if(con.quarter==4 && con.hhquarter1!=null){
                if(ypsum.testNameSpacema__Month_10_Connections__c==null){
                    ypsum.testNameSpacema__Month_10_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_11_Connections__c=con.hhquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_11_Connections__c);
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
                
            }else {
                
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_11_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
            }
        }
        else if(ypsum.testNameSpacema__P_L_Product__c!=null && ypsum.testNameSpacema__P_L_Product__c=='Blackberry' && ypsum.testNameSpacema__Year__c==con.year){
            if(con.quarter==1 && con.bbquarter1!=null){
                if(ypsum.testNameSpacema__Month_1_Connections__c==null){
                    ypsum.testNameSpacema__Month_1_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=con.bbquarter1;
                carriedCons=Integer.valueof(ypsum.testNameSpacema__Month_2_Connections__c);
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }else {
                if(ypsum.testNameSpacema__Year__c>1){
                    ypsum.testNameSpacema__Month_1_Connections__c=carriedCons;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }
            if(con.quarter==2 && con.bbquarter1!=null){
                if(ypsum.testNameSpacema__Month_4_Connections__c==null){
                    ypsum.testNameSpacema__Month_4_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_5_Connections__c=con.bbquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_5_Connections__c);
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }else {
                ypsum.testNameSpacema__Month_5_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }
            if(con.quarter==3 && con.bbquarter1!=null){
                if(ypsum.testNameSpacema__Month_7_Connections__c==null){
                    ypsum.testNameSpacema__Month_7_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_8_Connections__c=con.bbquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_8_Connections__c);
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }else {
                
                ypsum.testNameSpacema__Month_8_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }
            if(con.quarter==4 && con.bbquarter1!=null){
                if(ypsum.testNameSpacema__Month_10_Connections__c==null){
                    ypsum.testNameSpacema__Month_10_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_11_Connections__c=con.bbquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_11_Connections__c);
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
                
            }else {
                
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_11_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
            }
        }
        else if(ypsum.testNameSpacema__P_L_Product__c!=null && ypsum.testNameSpacema__P_L_Product__c=='MCC' && ypsum.testNameSpacema__Year__c==con.year){
            if(con.quarter==1 && con.mccquarter1!=null){
                if(ypsum.testNameSpacema__Month_1_Connections__c==null){
                    ypsum.testNameSpacema__Month_1_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=con.mccquarter1;
                carriedCons=Integer.valueof(ypsum.testNameSpacema__Month_2_Connections__c);
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }else{
                if(ypsum.testNameSpacema__Year__c>1){
                    ypsum.testNameSpacema__Month_1_Connections__c=carriedCons;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }
            if(con.quarter==2 && con.mccquarter1!=null){
                if(ypsum.testNameSpacema__Month_4_Connections__c==null){
                    ypsum.testNameSpacema__Month_4_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_5_Connections__c=con.mccquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_5_Connections__c);
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }else {
                ypsum.testNameSpacema__Month_5_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }
            if(con.quarter==3 && con.mccquarter1!=null){
                if(ypsum.testNameSpacema__Month_7_Connections__c==null){
                    ypsum.testNameSpacema__Month_7_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_8_Connections__c=con.mccquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_8_Connections__c);
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }else {
                
                ypsum.testNameSpacema__Month_8_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }
            if(con.quarter==4 && con.mccquarter1!=null){
                if(ypsum.testNameSpacema__Month_10_Connections__c==null){
                    ypsum.testNameSpacema__Month_10_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_11_Connections__c=con.mccquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_11_Connections__c);
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
                
            }else {
                
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_11_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
            }
        }
        
        else if(ypsum.testNameSpacema__P_L_Product__c!=null && ypsum.testNameSpacema__P_L_Product__c=='Voice' && ypsum.testNameSpacema__Year__c==con.year){
            if(con.quarter==1 && con.vquarter1!=null){
                if(ypsum.testNameSpacema__Month_1_Connections__c==null){
                    ypsum.testNameSpacema__Month_1_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=con.vquarter1;
                carriedCons=Integer.valueof(ypsum.testNameSpacema__Month_2_Connections__c);
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }else {
                if(ypsum.testNameSpacema__Year__c>1){
                    ypsum.testNameSpacema__Month_1_Connections__c=carriedCons;
                }
                ypsum.testNameSpacema__Month_2_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_3_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_4_Connections__c=carriedCons;
            }
            if(con.quarter==2 && con.vquarter1!=null){
                if(ypsum.testNameSpacema__Month_4_Connections__c==null){
                    ypsum.testNameSpacema__Month_4_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_5_Connections__c=con.vquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_5_Connections__c);
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }else {
                ypsum.testNameSpacema__Month_5_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_6_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_7_Connections__c=carriedCons;
            }
            if(con.quarter==3 && con.vquarter1!=null){
                if(ypsum.testNameSpacema__Month_7_Connections__c==null){
                    ypsum.testNameSpacema__Month_7_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_8_Connections__c=con.vquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_8_Connections__c);
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }else{
                
                ypsum.testNameSpacema__Month_8_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_9_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
            }
            if(con.quarter==4 && con.vquarter1!=null){
                if(ypsum.testNameSpacema__Month_10_Connections__c==null){
                    ypsum.testNameSpacema__Month_10_Connections__c=0;
                }
                ypsum.testNameSpacema__Month_11_Connections__c=con.vquarter1;
                carriedCons=Integer.valueOf(ypsum.testNameSpacema__Month_11_Connections__c);
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
                
            }else {
                
                ypsum.testNameSpacema__Month_10_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_11_Connections__c=carriedCons;
                ypsum.testNameSpacema__Month_12_Connections__c=carriedCons;
            }
        }
        
        
    }
}

update yprodSummary;
ApexPages.Message myMsg = new ApexPages.Message(ApexPages.severity.CONFIRM, 'Saved Successfully');
ApexPages.addMessage(myMsg);

return null;
}
public PageReference cancel(){
return null;
}
class Connection{
public String Connection{get;set;}
public Double voice{get;set;}
public Double hh{get;set;}
public Double bb{get;set;}
public Double mcc{get;set;}
public integer year{get;set;}
public integer quarter{get;set;}

public integer vquarter1{get;set;}
public integer hhquarter1{get;set;}
public integer bbquarter1{get;set;}
public integer mccquarter1{get;set;}


}
}