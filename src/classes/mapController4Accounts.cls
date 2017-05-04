public with sharing class mapController4Accounts {
public List<Account> accounts{get; private set;}
public List<Account> accounts1{get; private set;}

public static final String GEOCODING_URI_BASE = 'https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=';

// For purposes of this demo I'll geocode only couple of addresses server-side. Real code can use the commented out value.
public static final Integer MAX_CALLOUTS_FROM_APEX = 10; // Limits.getLimitCallouts()

public mapController4Accounts(){
    accounts1 = new List<Account>();
    accounts1 = [SELECT Id, Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry,  
                 Location_Latitude__c, Location_Longitude__c FROM Account LIMIT 20]; 
}

public void find() {
    if(accounts1.size()>0){
        serverSideGeocode();
    } else {
        if(accounts1 != null) {
            accounts1.clear();
        }
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'No Accounts to search.'));
    }
}

public void clearGeocodedData(){
    for(Account a : accounts1){
       a.Location_Latitude__c =  null;
       a.Location_Longitude__c = null;
    }
    Database.update(accounts1, false);
    accounts1.clear();
}

public String getAccountsJson(){
    return JSON.serialize(accounts1);
}
public String getDebugAccountsJson(){
    return JSON.serializePretty(accounts1);
}

private void serverSideGeocode(){
    List<Account> accountsToUpdate = new List<Account>();
    Http h = new Http();  
    HttpRequest req = new HttpRequest();
    req.setMethod('GET'); 
    req.setTimeout(10000);

    for(Account a : accounts1){
        if((a.Location_Latitude__c == null || a.Location_Longitude__c == null)){
            String address = a.ShippingStreet != null ? a.ShippingStreet + ' ' : '' +
                a.ShippingCity != null ? a.ShippingCity + ' ' : '' +
                a.ShippingState != null ? a.ShippingState + ' ' : '' +
                a.ShippingPostalCode != null ? a.ShippingPostalCode + ' ' : '' +
                a.ShippingCountry != null ? a.ShippingCountry : '';
            if(address != ''){
                req.setEndpoint(GEOCODING_URI_BASE + EncodingUtil.urlEncode(address, 'UTF-8'));
                try{
                    HttpResponse res = h.send(req);
                    GResponse gr = (GResponse) JSON.deserialize(res.getBody(), mapController4Accounts.GResponse.class);
                    if(gr.status == 'OK'){
                        LatLng ll = gr.results[0].geometry.location;
                        a.Location_Latitude__c = String.valueof(ll.lat);
                        a.Location_Longitude__c = String.valueof(ll.lng);
                        accountsToUpdate.add(a);
                    } else {
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Geocoding of "' + address + '" failed:' + gr.status));
                    }
                }catch(Exception e){
                    ApexPages.addMessages(e);
                }
            }
            // Bail out if we've reached limit of callouts (not all contacts might have been processed).
            if(Limits.getCallouts() == MAX_CALLOUTS_FROM_APEX) {
                break;
            }
        }
    }
    if(!accountsToUpdate.isEmpty()) {
        Database.update(accountsToUpdate, false); // some data in Developer editions is invalid (on purpose I think).
        // If update fails because "j.davis@expressl&amp;t.net" is not a valid Email, I want the rest to succeed
    }
}

// Helper class - template into which results of lookup will be parsed. Some fields are skipped!
// Visit https://developers.google.com/maps/documentation/geocoding/#Results if you need to create full mapping.
public class GResponse{
    public String status;
    public GComponents[] results;
}
public class GComponents{
   public String formatted_address;
   public GGeometry geometry;
}
public class GGeometry {
    public LatLng location;
}
public class LatLng{
    public Double lat, lng;
}
}