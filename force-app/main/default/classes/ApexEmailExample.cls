public  class ApexEmailExample {

   public static void sendEmail(){
       // If we know how many addresses the email will be sent to from this transaction
       // We can set the reserve capacity
       Messaging.reserveSingleEmailCapacity(2);

       //We instantiate our single email message object
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

       // Strings to hold the email addresses to which you are sending the email.
       String[] toAddresses = new String[] {'gbritgs@gmail.com'};
       //Assign the TO address to our mail object
       mail.setToAddresses(toAddresses);

       //List of ccAddress
       //String[] ccAddresses = new String[] {'wekone8076@mailvxin.net'};
       // Assign the CC addresses
       //mail.setCcAddresses(ccAddresses);

       // Here we can set the address that will be used when a recipient replies to the email
       mail.setReplyTo('guilherme.bgomes@mrv.com.br');

       // Specify the name used as the display name.
       mail.setSenderDisplayName('Teste');

       // Set the subject line for your email address.
       mail.setSubject('Email Subject');

       // You can set this to true if you want to BCC yourself on the email
       mail.setBccSender(false);

       // You can specify your plain text here
       mail.setPlainTextBody('Sample plain text goes here');

       //Specify any html - for example this will display a link in the email
       mail.setHtmlBody('Your Link <a href=https://www.salesforce.com/>click here.</a>');

       // Send the email
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   }
}