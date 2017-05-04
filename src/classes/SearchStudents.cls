public class SearchStudents{
List <testNameSpacema__Student_Details__c> queryResult;
    public PageReference search() {
        return null;
    }
    
 public String name{
 get{return name;}
 set{name=value;}
 }
 
 public List <testNameSpacema__Student_Details__c> getSearch()
 {
     String qryString = 'SELECT Id FROM testNameSpacema__Student_Details__c  WHERE (IsDeleted = false and Name like \'%' + name + '%\') or (Name like \'%\')';
     List <testNameSpacema__Student_Details__c> queryResult = Database.query(qryString);
     return  queryResult;
 }
}