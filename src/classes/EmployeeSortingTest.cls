@isTest
private class EmployeeSortingTest {
    static testmethod void test1() {        
        List<Employee> empList = new List<Employee>();
        Employee e1=new Employee();
        e1.id=101;
        e1.Name='Joe Smith';
        e1.phone='4155551212';
        
        Employee e2=new Employee();
        e1.id=101;
        e1.Name='J. Smith';
        e1.phone='4155551212';
        
        Employee e3=new Employee();
        e1.id=25;
        e1.Name='Caragh Smith';
        e1.phone='4155551000';
        
        Employee e4=new Employee();
        e1.id=105;
        e1.Name='Mario Ruiz';
        e1.phone='4155551099';
        
        empList.add(e1);
        empList.add(e2);
        empList.add(e3);
        empList.add(e4);
        
        // Sort using the custom compareTo() method 
    
        empList.sort();
        
        // Write list contents to the debug log 
    
        System.debug(empList);
        
        // Verify list sort order. 
    
        System.assertEquals('Caragh Smith', empList[0].Name);
        System.assertEquals('Joe Smith', empList[1].Name); 
        System.assertEquals('J. Smith', empList[2].Name);
        System.assertEquals('Mario Ruiz', empList[3].Name);
    }
}