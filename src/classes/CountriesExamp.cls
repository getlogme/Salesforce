global class CountriesExamp{
WebService static void methodDisplay(String[] id){
System.debug('#######Test Method from onclcik of custom button from javascript ##########'+id);
m1();
}

public static PageReference m1(){
PageReference nextPage= new PageReference('/a09/o');
nextPage.setredirect(true);
return nextPage;
}

}