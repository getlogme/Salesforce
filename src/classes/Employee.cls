global class Employee implements Comparable {

    public Long id;
    public String name;
    public String phone;
    
    // Constructor 
    
    public Employee() {}
    // Implement the compareTo() method 
    
    global Integer compareTo(Object compareTo) {
        Employee compareToEmp = (Employee)compareTo;
        if (id == compareToEmp.id) return 0;
        if (id > compareToEmp.id) return 1;
        return -1;        
    }
}