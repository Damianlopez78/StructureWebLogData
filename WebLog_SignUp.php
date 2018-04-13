<?php
    if (isset($_POST['register_form']))
    {
    include 'WebLog_DB.php';

    $fname=$_POST['fname'];
    $lname=$_POST['lname'];
    $Email=$_POST['email'];
    $username=$_POST['username'];
    $password=$_POST['password'];

    mysql_query("INSERT INTO User(fname,lname,email,username,password)
    VALUES ('$fname','$lname','$email','$username','$password')");
    }
    ?> 