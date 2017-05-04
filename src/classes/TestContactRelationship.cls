@isTest

private class TestContactRelationship{

    

    static testMethod void method2TestContactRelationship(){ 

       

        Account Acc = new Account(Name = 'TestAccount',Status__c ='Active');

        insert Acc;

        Account Acc1 = new Account(Name = 'TestAccount1',Status__c ='Active');

        insert Acc1;

        Contact Con = new Contact(LastName = 'TestContact');

        insert Con;

        Contact Con1 = new Contact(LastName = 'TestContact1');

        insert Con1;

        Contact Con2 = new Contact(LastName = 'TestContact2');

        insert Con2;

        Contact Con3 = new Contact(LastName = 'TestContact3');

        insert Con3;

        List<Contact_Relationship__c> conList=new List<Contact_Relationship__c>();

        Contact_Relationship__c  CR1 = new Contact_Relationship__c (Account__c = Acc.Id, Contact__c = Con1.Id, Role__c = 'Business User');

        conList.add(CR1);

        Contact_Relationship__c  CR2 = new Contact_Relationship__c (Account__c = Acc1.Id, Contact__c = Con1.Id, Role__c = 'Business User');

        conList.add(CR2);

        insert conList;

        List<AccountContactRole> cra=[select Id from AccountContactRole];

        delete cra;

        List<Contact_Relationship__c> conList1=new List<Contact_Relationship__c>();

        Contact_Relationship__c  CR3 = new Contact_Relationship__c (Account__c = Acc.Id, Contact__c = Con2.Id, Role__c = 'Other');

        conList.add(CR1);

        Contact_Relationship__c  CR4 = new Contact_Relationship__c (Account__c = Acc1.Id, Contact__c = Con3.Id, Role__c = 'Other');

        conList.add(CR2);

        insert conList1;

        delete CR1;

       

    }

    

    static testMethod void method2TestContactRelationship1(){ 

        

        Account Acc = new Account(Name = 'TestAccount',Status__c ='Active');

        insert Acc;

        Account Acc1 = new Account(Name = 'TestAccount1',Status__c ='Active');

        insert Acc1;

        Contact Con = new Contact(LastName = 'TestContact');

        insert Con;

        Contact Con1 = new Contact(LastName = 'TestContact1');

        insert Con1;

        Contact Con2 = new Contact(LastName = 'TestContact2');

        insert Con2;

        Contact Con3 = new Contact(LastName = 'TestContact3');

        insert Con3;

        

        List<AccountContactRole> cra=[select Id from AccountContactRole];

        delete cra;

        List<Contact_Relationship__c> conList1=new List<Contact_Relationship__c>();

        Contact_Relationship__c  CR3 = new Contact_Relationship__c (Account__c = Acc.Id, Contact__c = Con2.Id, Role__c = 'Other');

        conList1.add(CR3);

        Contact_Relationship__c  CR4 = new Contact_Relationship__c (Account__c = Acc1.Id, Contact__c = Con3.Id, Role__c = 'Other');

        conList1.add(CR4);

        

            insert conList1;

       
        //delete CR1;

       

    }

}