<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%-- QUAN TRỌNG: Khai báo thư viện JSTL --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="style/main.css" type="text/css"/>
</head>
<body>
    <h1>Download registration</h1>
    
    <form action="download" method="post">
        <input type="hidden" name="action" value="register">
        
        <label>Email:</label>
        
        <input type="email" name="email" value="<c:out value='${cookie.userEmail.value}'/>" required><br>
        
        <label>First Name:</label>
        <input type="text" name="firstName" value="<c:out value='${cookie.firstNameCookie.value}'/>"><br>
        
        <label>Last Name:</label>
        <input type="text" name="lastName"><br>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>