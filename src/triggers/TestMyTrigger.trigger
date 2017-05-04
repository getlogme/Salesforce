trigger TestMyTrigger on testNameSpacema__UserCustomObject__c (after insert,after update,after delete) {

if(Trigger.isInsert) {
     System.debug('----Insert----');
     testNameSpacema__UserCustomObject__c userCustomObject=Trigger.new[0];
     String profile=userCustomObject.testNameSpacema__Profile__c;
     Profile objprofile=[select name,id from profile where name=:profile];
     System.debug('----profile--id----'+objprofile.id);
     
     String strLanguage=userCustomObject.testNameSpacema__Language__c;
     String strEmailEncoding=userCustomObject.testNameSpacema__Email_Encoding__c;
     String strTimeZone=userCustomObject.testNameSpacema__Time_Zone__c;
     System.debug('----strLanguage----'+strLanguage);
     System.debug('----strEmailEncoding----'+strEmailEncoding);
     System.debug('----strTimeZone----'+strTimeZone);
     if(strLanguage.equals('English'))
     {
       strLanguage='en_US';  
     }
     if(strEmailEncoding.equals('General US &amp;amp; Western Europe (ISO-8859-1, ISO-LATIN-1)')){
        strEmailEncoding='ISO-8859-1';
     }
     if(strTimeZone.equals('(GMT+14:00) Line Is. Time (Pacific/Kiritimati)')){
        strTimeZone='America/Los_Angeles';
     }
     
     
     
     User objuser=new User();
     objuser.LastName=userCustomObject.testNameSpacema__Last_Name__c;
     objuser.Alias=userCustomObject.testNameSpacema__Alias__c;
     objuser.email=userCustomObject.testNameSpacema__Email__c;
     objuser.username=userCustomObject.testNameSpacema__User_Name__c;
     objuser.languagelocalekey=strLanguage;
     objuser.emailencodingkey=strEmailEncoding;
     objuser.timezonesidkey=strTimeZone;
     objuser.profileid=objprofile.id;
     objuser.localesidkey=strLanguage;
     //objuser.user_id__c=userCustomObject.testNameSpacema__User_Name__c;  
     insert objuser;

} else if(Trigger.isUpdate) {

}else if(Trigger.isDelete) {

}


}