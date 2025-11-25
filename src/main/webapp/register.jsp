<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Download Registration</title>
    <link rel="stylesheet" href="style/main.css" type="text/css"/>
</head>
<body>
    <h1>Download registration</h1>
    
    <p>To register for our downloads, enter your name and email address below.</p>
    
    <form action="download" method="post">
        <input type="hidden" name="action" value="register">
        
        <label>Email:</label>
        <input type="email" name="email" value="${user.email}" required><br>
        
        <label>First Name:</label>
        <input type="text" name="firstName" value="${user.firstName}"><br>
        
        <label>Last Name:</label>
        <input type="text" name="lastName" value="${user.lastName}"><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>