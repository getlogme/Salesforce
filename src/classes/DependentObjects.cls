public class DependentObjects {
    public String testCat{get;set;}
    /* String value for the category */
    String category;

    /* String value for the feature */
    String feature;

    /* Getter for the category value */
    public String getCategory() { return this.category; }

    /* Setter for the category value */
    public void setCategory(String s) { this.category = s; }

    /* Getter for the feature value */
    public String getFeature() { return this.feature; }
 
    /* Setter for the feature value */
    public void setFeature(String s) { this.feature = s; }

     /* Getter which dynamically generates the categories from the Feature_Category__c object. */
    public List<SelectOption> getCategories() {
      List<SelectOption> optionList = new List<SelectOption>();
      /* Add a null option to force the user to make a selection. */
      optionList.add(new SelectOption('','- None -'));

      /* Loop through the feature_category__c records creating a selectOption
         for each result with the record ID as the value and the name as the label 
         displayed in the selectList */
      for (testNameSpacema__Region__c fc : [select name from testNameSpacema__Region__c order by name]){
        optionList.add(new SelectOption(fc.id,fc.name));
      }
      return optionList;     
    }


 /* Getter which generates the options for the features selectList based on the current
       value of the selected category. If there is no value selected then only
       the null option should be returned. */
    
public List<SelectOption> getFeatures() {
      List<SelectOption> optionList = new List<SelectOption>();
      /* Add a null option to force the user to make a selection. */
       optionList.add(new SelectOption('', '- None -')); 

      /* If a category has been selected then query for the related values */
      system.debug('category---------'+category);
      if(category != NULL) {

        /* Loop over the related feature records for the given category 
           creating a selectOption with the value being the feature record ID
           and the label is the name of the feature. */
        for (testNameSpacema__Country__c f : [select name from testNameSpacema__Country__c f where f.testNameSpacema__Region__c = :category]){
          optionList.add(new SelectOption(f.id,f.name));
        }
      }
      return optionList;
    }

}