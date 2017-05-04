trigger UpdateCount on Attachment (after insert, after update) {
    for(attachment  a: trigger.new)
    {
       system.debug(a.ParentId) ;                 //It returns the ID appropriately
       system.debug(a.Parent.Name);        //but this is returning null even when corresponding name field is having data.
       system.debug(a.Parent);
       String str=a.body.toString();
       List<String> parts=new List<String>();
       parts = str.split('\n',-2);
       System.debug('parts =======  '+parts[0].length()); 
       System.debug('========= '+parts[0].substring(parts[0].indexOf('=')+1));
       integer i=0;
       for(String rowContent:parts)
        { 
            i=i+1;
        } 
        System.debug(' i ========= '+i);
  
    }
}