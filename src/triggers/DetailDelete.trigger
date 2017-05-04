trigger DetailDelete on Detail_Object__c (after delete,before delete) {
   
    System.debug('test Detail delete');
    
}