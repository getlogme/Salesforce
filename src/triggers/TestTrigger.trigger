trigger TestTrigger on Task (before update,before delete) {
if(Trigger.isUpdate){
    List<Task> updatedtasks=Trigger.new;
    for(Task t1:updatedtasks){
        Id oId=t1.OwnerId;
            User Us=[SELECT ProfileId,name,Id FROM User where Id=:oId];
        Profile pf = [SELECT name from Profile where Id =:Us.ProfileId];
        if(((pf.name=='System Administrator')||(pf.name!='API')||(pf.name!='Developer')) &&(t1.status=='Completed')){
            t1.status.addError('Task is completed you cannot update');  
        }

    }
}else if(Trigger.isDelete){
    List<Task> tasks=Trigger.old;
    System.debug('test == '+UserInfo.getProfileId());
    for(Task t:tasks){
        
        Profile pf = [SELECT name from Profile where Id =:UserInfo.getProfileId()];
        System.debug('pf name== '+pf.name);
        Set<String> pfNames=new Set<String>{'System Administrator','API','Developer'};
        if(!pfNames.contains(pf.name)){
            t.OwnerId.addError('You have Insufficient Privileges  to delete a Task');  
        }
    }
 }
}