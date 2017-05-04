public class UtilsGeneral {
    
    public static sObject newBlankSObject(sObject so) {
        return so.getSObjectType().newSObject();
    }
    
}