public class RedirectPageSelectorController {

private ApexPages.StandardController controller = null;
public List<SelectOption> recTypeList{get;set;}
public String selRecType{get;set;}
public RedirectPageSelectorController (ApexPages.StandardController controller) {
    recTypeList=new List<SelectOption>();
    for(RecordType rt:[select Id,Name from RecordType where sobjecttype='Case']){
        recTypeList.add(new SelectOption(rt.Id,rt.Name));    
    }
    this.controller = controller;
}

public PageReference getRedir(){
    return new PageReference('/500/e?nooverride=1&RecordType='+selRecType);
}

// Inherit previous parameters, more imporatntly, RecordType parameter!
private String getParameters(){
string param = '';
Map<String, String> strMap = ApexPages.currentPage().getParameters();
String[] keys = new String[]{'RecordType', 'retURL', 'cancelURL'};
for(String s : keys){
if(strMap.containsKey(S)) param += s + '=' + strMap.get(s) + '&';
}
if(param.length() > 0) param = param.substring(0, param.length()-1);
return param;
}

}