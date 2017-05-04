public class MySQLDataController{
public String outputStr{get;set;}

public MySQLDataController(){

MySQLData.NewMysqlServerPortTypeSoapPort mysql=new MySQLData.NewMysqlServerPortTypeSoapPort();
EmpBean.ArrayOfEmployee_literal arrData=mysql.getEmpData();
EmpBean.Employee[] arrEmpData=arrData.Employee;

for(EmpBean.Employee emp:arrEmpData){
 outputStr=outputStr+emp.EmpNo+'  '+emp.EmpName;
}

}


}