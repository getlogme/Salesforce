public class MyClass{

Boolean isSelected = false; 

public void setIsSelected(Boolean b) { //this sets the selected value from your checkbox 

this.isSelected = b; 

} 

public Boolean getIsSelected() { //this gets the selected value to the second page

return this.isSelected; 

} 

public PageReference goToNextPage() { //button action 

PageReference pageRef = Page.Page2; 

return pageRef.setRedirect(false); 

} 

}