trigger insertStudentDetails on Student_Details__c (after insert) {
Student_Details__c test=Trigger.new[0];
system.debug('-----test------'+test.name);
}