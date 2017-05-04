public class TestUseBean{
    
public TestUseBean()
{
    ListOfBeanObj();
    
}
public List<TestBean>   ls{get;set;}
List<TestBean> ls1=new List<TestBean>();
public List<TestBean> ListOfBeanObj()
{
    TestBean tb=new TestBean();
    TestBean tb1=new TestBean();
    tb.firstName='Shivlal';
    tb.lastName='Sherkhane';
    tb.city='Hyderabad';
    
    tb1.firstName='Venkat';
    tb1.lastName='Topuri';
    tb1.city='Prakasam';
    
     ls1.add(tb);
     ls1.add(tb1);
     ls=ls1;
     return ls;
}
}