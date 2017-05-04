public class McolMSelectboxController {
public String sObjectAPIName{get;set;}
public List<Options> leftOptions{get;set;}
public List<Options> rightOptions{get;set;}
public Integer i;
public McolMSelectboxController(){
i=0;
leftOptions=new List<Options>();
rightOptions=new List<Options>();
for(Account ac:[select Id,Name,Phone from Account]){
    Options o=new Options();
    o.selected=false;
    o.accId=ac.Id;
    o.Name=ac.Name;
    o.phone=String.valueOf(ac.Phone);
    leftOptions.add(o);
    
}
}

public PageReference addOpt(){
List<Options> tempOptions=new List<Options>();

for(Options opt:leftOptions){
    if(opt.selected==true){
        opt.selected=false;
        opt.primary=i==0?true:false;
        rightOptions.add(opt);
        i=i+1;
    }else{
        tempOptions.add(opt);
    }
}
leftOptions.clear();
leftOptions.addAll(tempOptions);

return null;
}
public PageReference remove(){
List<Options> tempOptions=new List<Options>();
Integer i=0;
for(Options opt:rightOptions){
    if(opt.selected==true){
        opt.selected=false;
        opt.primary=false;
        leftOptions.add(opt);
        i=i+1;
    }else{
        tempOptions.add(opt);
    }
}
rightOptions.clear();
rightOptions.addAll(tempOptions);

return null;
}

public PageReference saveOptions(){
return null;
}

public PageReference cancel(){
return null;
}


public class Options{
    public Boolean selected{get;set;}
    public Boolean primary{get;set;}
    public String accId{get;set;}
    public String Name{get;set;}
    public String phone{get;set;}
}


}