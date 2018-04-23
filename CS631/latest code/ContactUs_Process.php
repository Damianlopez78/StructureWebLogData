<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Contact Us</title>
<link rel="STYLESHEET" type="text/css" href="contact-us.css" />
</head>
<body>

<h1>Thank you for your Interest. Your Information are below.</h1> 

<?php

echo "<br /><strong>Your First name:</strong> " . $_POST["firstname"]; 

echo "<br /><strong>Your Last name:</strong> " . $_POST["lastname"]; 

echo "<br /><strong>Email Address:</strong> " . $_POST["email"]; 
     
echo "<br /><strong>Your Message:</strong> " . $_POST["message"]; 

?> 


</body>
</html>