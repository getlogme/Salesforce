public class DemoXmlReader{
public class contact{
    String fName;
    String lName;
    String address;
    String city;
    String state;
    String zip;
    String product;
    String perunitprice;
    String quantity;
    String totalprice;
    String description;
    String shipmethod;
    String estimatedshipdate;
   }
   contact[] parseContacts(XmlStreamReader reader) {
     contact[] cons= new contact[0];
     while(reader.hasNext()) {
//  Start at the beginning of the book and make sure that it is a book  
         if (reader.getEventType() == XmlTag.START_ELEMENT) {
            if ('contact' == reader.getLocalName()) {
                //  Pass the book to the parseBook method (below)   
                contact con= parseContact(reader);
                cons.add(con);
            }
         }
        reader.next();
     }
    return cons;
   }
   
   // Parse through the XML, deterimine the auther and the characters  
    
   contact parseContact(XmlStreamReader reader) {
     contact cont = new contact();
    // cont.author = reader.getAttributeValue('', 'name');
     while(reader.hasNext()) {
        if (reader.getEventType() == XmlTag.END_ELEMENT) {
           break;
        } else if (reader.getEventType() == XmlTag.CHARACTERS) {
           cont.fName = reader.getText();
        }
        reader.next();
     }
     return cont;
   }

   
}