public with sharing class SendSMSContactExtension {
 
    private final Contact contact;
    private final String TOKEN = 'e1701509-4ba5-4b7c-9151-6e492703208a';
    private final String SIGNATURE = '/YEMklNQFFhoNk53zZhlMeZD';
    private final String ENCODING = 'Seven';
    public String recipient {get; set;}
    public String message {get; set;}
 
    public SendSMSContactExtension (ApexPages.StandardController stdController) {
        this.contact = (Contact)stdController.getRecord();
    } //close constructor
 
    public PageReference sendSMS () {
 
       if (contact.MobilePhone != null) {
 
          //this reformats the phone number as required by the web service; removes all spaces and characters while adding the country code.  Currently
          //it's hardcoded to insert the U.S. country code prefix.
          recipient = + contact.MobilePhone;
          recipient = recipient.replace('-', '');
          recipient = recipient.replace('(','');
          recipient = recipient.replace(')','');
          recipient = recipient.replace(' ', '');
 
          //initialize the SOAP object and call the web service 'Send_Plain'.  Set the timeout.
          upsidewirelessComWebserviceSms.SMSSoap sms = new upsidewirelessComWebserviceSms.SMSSoap();
          sms.timeout_x = 2000;
          upsidewirelessComWebserviceSms.SMSSendResult result = sms.Send_Plain(TOKEN,SIGNATURE,recipient,message,ENCODING);
 
          //Create a new task, related to the Contact, if the response is successful.
          if (result.isOk == true) {
             Task smsTask = new Task (Type='SMS',
                                      WhoID = contact.id,
                                      Status = 'Completed',
                                      ActivityDate = System.today(),
                                      Description = message,
                                      Subject = 'SMS Sent'
                                     );
             try {
                insert smsTask;
             }  catch (System.Dmlexception e) {
                   System.debug('Error: Unable to insert task: ' + e);
                 }
 
             return new ApexPages.StandardController(contact).view();
 
          } else {
               //this message will be triggered if the text was not sent successfully.
               ApexPages.Message didNotSendMsg = new ApexPages.Message(ApexPages.severity.Info, 'Sorry, but the SMS did not send correctly.  Please try again.');
               ApexPages.addMessage(didNotSendMsg);
               return null;
             } //close else
 
       } //close first if-statement
          else {
             //this message will be triggered if the Contact doesn't have a mobile phone number.
             ApexPages.Message noMobileMsg = new ApexPages.Message(ApexPages.severity.Info, 'This Contact does not have a mobile phone number.  Please update the mobile number and try again.');
             ApexPages.addMessage(noMobileMsg);
             return null;
          }
 
    } //close sendSMS method
 
    public PageReference cancel () {
       //sends the user back to the Contact detail page.
       PageReference contactPage = new ApexPages.StandardController(contact).view();
       contactPage.setRedirect(true);
       return contactPage;
    } //close cancel method
 
} //close Class