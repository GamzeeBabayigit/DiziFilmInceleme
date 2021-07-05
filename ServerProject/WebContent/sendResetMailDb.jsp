<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<%
request.setCharacterEncoding("ISO-8859-9");
%>
<%
   String result;

   // alici mail adresi
   String to = request.getParameter("to");

   // gonderici mail adresi
   String from = request.getParameter("--@gmail.com");
   //gonderici sifre
   String password=request.getParameter("passwrd");

   // ozellik nesnesi olusturuluyor
   Properties properties = System.getProperties();

   // mail server ayarlari yapiliyor
   properties.put("mail.smtp.host", "smtp.gmail.com");
   properties.put("mail.smtp.port", "587");
   properties.put("mail.smtp.starttls.enable", "true");
   properties.put("mail.smtp.auth", "true"); 

   //SSL sertifikasi kullanilmak istenirse bu ayarlar eklenir
   properties.put("mail.smtp.socketFactory.port", "465");
   properties.put("mail.smtp.socketFactory.class", 
       "javax.net.ssl.SSLSocketFactory");
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.port", "465");

   // Mail icin session nesnesi olusturulur.
   Session mailSession = Session.getInstance(properties,
                           new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                           return new PasswordAuthentication("--@gmail.com", "passwrd");
                    }
             }); 

   try {
      // olusturulan sessiondan mimemesage nesnesi olusturulur
      MimeMessage message = new MimeMessage(mailSession);
      
      // gonderici adresi set ediliyor
      message.setFrom(new InternetAddress("--@gmail.com"));
      
      // alici adresi set ediliyor
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // mail basligi set ediliyor
      message.setSubject("Reset Password !");
      
      // mail icerigi set ediliyor
    
      message.setText(request.getParameter("message"));
      
      // mail gonderiliyor
      Transport.send(message);
      //mail gonderilir ise sonuc 1
      response.sendRedirect("sendresetmail.jsp?sonuc=1");
   } catch (MessagingException mex) {
      mex.printStackTrace();
    //mail gonderilemez ise sonuc 0
      response.sendRedirect("sendresetmail.jsp?sonuc=0");
   }
%>