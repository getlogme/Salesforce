public without sharing class AskSalesCoordinatorNew{
    public String accId{get;set;}
    public String userAgent{get;set;}
    public String RecName{get;set;}
    public String MainPicklistValue{get;set;}
    public  String SelectedValues{get;set;}
    public string subject{get;set;}
    public string msg{get;set;}
    public list<String> SelectedValuescc{get;set;}   
    public String Values2Remove{get;set;}
    List<SelectOption> options1 = new List<SelectOption>();
    List<SelectOption> options2 = new List<SelectOption>();
    List<SelectOption> options3 = new List<SelectOption>(); 
    Set<Id> availableProducts = new Set<Id>();
    public List<SelectOption> getAddtoList{get;set;}
    public List<SelectOption> getAddbccList{get;set;}
    public List<SelectOption> getAddccList{get;set;}
    public List<String> sltdToList{get;set;}
    public List<String> sltdBccList{get;set;}
    public List<String> sltdCcList{get;set;}
    public Set<String> sltdContactSet{get;set;}
     public List<SelectOption> PickListOptions1{get;set;}
    public string partnumber{get;set;}
    public List<Attachment> getAttchList(){
        return null;
    }
    public set<string> fulllist{get;set;}
    public map<string,contact> conmap = new map<string,contact>();
    public pagereference customsearch(){
    system.debug('Apexpages.currentPage().getParameters().get(partnumber) : '+Apexpages.currentPage().getParameters().get('partnumber'));
    partnumber = Apexpages.currentPage().getParameters().get('partnumber');
    system.debug('partnumber : '+partnumber);            
    string s;
    fulllist.clear();
    
    system.debug('testing----');
    if(partnumber!=null && partnumber !=''){
    
       s ='select id,name,accountid from contact where  accountid =' +'\''+ accountid+'\'' +'and name'+' '+'LIKE \''+String.escapeSingleQuotes(partnumber)+'%\'' ;
     
      list<contact> con =database.query(s);
     PickListOptions1.clear();
      conmap.clear();
     fulllist = new set<string>();
      for(contact c:con){
        fulllist.add(c.id);
        conmap.put(c.id,c);
        if((sltdContactSet==null) || (sltdContactSet!=null && !sltdContactSet.contains(c.Id))){
         PickListOptions1.add(new SelectOption(c.id,c.Name));
         }
      }
    }else{
        s ='select id,name,accountid from contact where  accountid =' +'\''+ accountid+'\'' ;
     
      list<contact> con =database.query(s);
     PickListOptions1.clear();
      conmap.clear();
     fulllist = new set<string>();
      for(contact c:con){
        fulllist.add(c.id);
        conmap.put(c.id,c);
         if((sltdContactSet==null) || (sltdContactSet!=null && !sltdContactSet.contains(c.Id))){
             PickListOptions1.add(new SelectOption(c.id,c.Name));
         }     
      } 
    }
    
    return null;
    }
    public String Accountid{get;set;}
    public AskSalesCoordinatorNew(ApexPages.StandardController ctrl){
        accountid =Apexpages.currentPage().getparameters().get('caseId');
       /*string RequestorRegion =[select id,Requestor_Area__c from case where id =:accId].Requestor_Area__c;
       system.debug('RequestorRegion-----'+RequestorRegion);
       
       if(RequestorRegion =='PN'){
       accountid =[select id from account where name ='PN Sales Coordinator'].id;       
       }
       else if(RequestorRegion =='TN'){
       accountid =[select id from account where name ='TN Sales Coordinator'].id;       
       }*/
        
         conmap.clear();
         getAddtoList = new List<SelectOption>();
        getAddbccList = new List<SelectOption>();
        getAddccList = new List<SelectOption>();
        
        sltdToList=new List<String>();
        sltdBccList=new List<String>();
        sltdCcList=new List<String>();
        
        sltdContactSet=new Set<String>();
        PickListOptions1 =new List<SelectOption>();
        tolist = new set<string>();
        bcclist = new set<string>();
        cclist = new set<string>();
        String qry = 'SELECT Id, Name  FROM  contact where accountid =:accountid';
        List<contact> productsList = new List<contact>();
        productsList = database.Query(qry);
       fulllist = new set<string>();
        if(!productsList.isEmpty()){
            for(contact prod :productsList){
                  fulllist.add(prod.id);
                   conmap.put(prod.id,prod);
                    
                        PickListOptions1.add(new SelectOption(prod.Id,prod.name));
                                   
            }  
        }
        
    }
   
    public pagereference addtolist(){
       if(SelectedValuescc.size()>0){
           
          system.debug('full----------'+fulllist);
         set<string> tlist = new set<string>();
              list<contact> conlist = new list<contact>([select id,name from contact where id IN:SelectedValuescc]);
            // getAddtoList = new List<SelectOption>();
             PickListOptions1.clear();
              for(Contact con:conlist){
                   //tolist.clear();
                   tolist.add(con.id);
              }
              for(Contact con:conlist){
                 getAddtoList.add(new SelectOption(con.id,con.Name));
                 sltdToList.add(con.Name);
                 sltdContactSet.add(con.Id);
                 system.debug('con.id------'+con.id);
                 system.debug('fulllist--------'+fulllist);  
                 system.debug('tolist----'+tolist);
                 for(string c:fulllist){
                   if(!tolist.contains(c)&& !bcclist.contains(c)&& !cclist.contains(c) && !tlist.contains(c)){
                        tlist.add(c);
                       PickListOptions1.add(new SelectOption(conmap.get(c).id,conmap.get(c).name));
                    }
                 }              
                 
             }
          }
    return null;
    }
     public pagereference addbcclist(){
       if(SelectedValuescc.size()>0){
         set<string> blist = new set<string>();
              list<contact> conlist = new list<contact>([select id,name from contact where id IN:SelectedValuescc]);
             //getAddbccList = new List<SelectOption>();
             PickListOptions1.clear();
              for(Contact con:conlist){
                   bcclist.add(con.id);
            }
            for(Contact con:conlist){
                 getAddbccList.add(new SelectOption(con.id,con.Name));
                 sltdBccList.add(con.Name);
                 sltdContactSet.add(con.Id);
                 for(string c:fulllist){
                   if(!tolist.contains(c)&& !bcclist.contains(c)&& !cclist.contains(c)&& !blist.contains(c)){
                    blist.add(c);
                     PickListOptions1.add(new SelectOption(conmap.get(c).id,conmap.get(c).name));
                 }
              }
             }
          }
    return null;
    }
     public list<String> Values2Removefromtolist{get;set;}
     public list<String> Values2Removefrombcclist{get;set;}
      public list<String> Values2Removefromcclist{get;set;}
      public set<string> tolist{get;set;}
    public set<string> bcclist{get;set;}
    public set<string> cclist{get;set;}
    
     public pagereference addcclist(){
       if(SelectedValuescc.size()>0){
        
              list<contact> conlist = new list<contact>([select id,name from contact where id IN:SelectedValuescc]);
            // getAddccList = new List<SelectOption>();   
            PickListOptions1.clear();          
              for(Contact con:conlist){
                cclist.add(con.id); 
              }
              set<string> clist = new set<string>();
              for(Contact con:conlist){                
                 getAddccList.add(new SelectOption(con.id,con.Name));
                 sltdCcList.add(con.Name);
                 sltdContactSet.add(con.Id);
                 for(string c:fulllist){
                    if(!tolist.contains(c)&& !bcclist.contains(c)&& !cclist.contains(c) && !clist.contains(c) ){
                     clist.add(c);
                     PickListOptions1.add(new SelectOption(conmap.get(c).id,conmap.get(c).name));
                     }
              }
              }
             
          }
    return null;
    }
    
   
     public pagereference removeProducts(){
       
        if(Values2Removefromtolist.size()>0){ 
                set<string> stolist = new set<string>();
                for(String s :Values2Removefromtolist){
                    stolist.add(s);
                }
                system.debug('stolist------'+stolist.size());
                system.debug('stolist------'+stolist);
                system.debug('tolist------'+tolist.size());
          list<contact> conlist = new list<contact>([select id,name from contact where id IN:toList]);           
           getAddtoList.clear();
           sltdToList.clear();           
           //sltdContactSet.clear();
             system.debug('conlist------'+conlist.size());
              for(contact con :conList){
              system.debug('con------'+con);
                 if(!stolist.contains(con.id)){
                    getAddtoList.add(new SelectOption(con.id,con.Name));
                    sltdToList.add(con.Name);
                    sltdContactSet.add(con.Id);
                    }
                  else {
                   tolist.remove(con.id);
                    PickListOptions1.add(new SelectOption(con.id,con.Name));
                  }
                  }
              
                  
     }
      if(Values2Removefrombcclist.size()>0){ 
          list<contact> conlist = new list<contact>([select id,name from contact where id IN:bccList]);           
           getAddbccList.clear();
           sltdBccList.clear();
           set<string> sbcclist = new set<string>();
                for(String s :Values2Removefrombcclist){
                    sbcclist.add(s);
                }
              for(contact con :conList){
                 if(!sbcclist.contains(con.id)){
                    sltdBccList.add(con.Name); 
                    getAddbccList.add(new SelectOption(con.id,con.Name));
                    
                    }                 
                   else{
                    PickListOptions1.add(new SelectOption(con.id,con.Name));
                    bcclist.remove(con.id);
                    }
             }
              
                  
     }
      if(Values2Removefromcclist.size()>0){ 
          list<contact> conlist = new list<contact>([select id,name from contact where id IN:ccList]);           
           getAddccList.clear();
           sltdCcList.clear();
           set<string> scclist = new set<string>();
                for(String s :Values2Removefromcclist){
                    scclist.add(s);
                }
              for(contact con :conList){
                 if(! scclist.contains(con.id)){
                    getAddccList.add(new SelectOption(con.id,con.Name));
                    sltdCcList.add(con.Name); 
                  }  
                 else{
                   cclist.remove(con.id);
                    PickListOptions1.add(new SelectOption(con.id,con.Name));
                 }
                  }
              
                  
     }
        
        return null;
    
    }
   public PageReference back(){
       return new PageReference('/'+Apexpages.currentPage().getparameters().get('caseId'));
   } 
    
    
}