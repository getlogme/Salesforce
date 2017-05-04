public class InsertIntoMySQL{
public String eno{get;set;}
public String ename{get;set;}
public InsertIntoMySQL(){
    
}

public Pagereference insertRec(){
MySQLData1.NewMysqlServerPortTypeSoapPort port=new MySQLData1.NewMysqlServerPortTypeSoapPort();
    EmpBean1.ArrayOfEmployee_literal empdata=new EmpBean1.ArrayOfEmployee_literal();
    EmpBean1.Employee[] arre=new EmpBean1.Employee[1];
    EmpBean1.Employee e=new EmpBean1.Employee();
    e.EmpNo=eno;
    e.EmpName=ename;
    arre[0]=e;
    empdata.Employee=arre;
    port.insertEmpData(empdata);
    return null;
}

}