<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%-- Khai báo JSTL --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Download App</title>
    <link rel="stylesheet" href="style/main.css" type="text/css"/>
</head>
<body>
    
    <%-- 
       BÀI 9-1: Kiểm tra điều kiện
       Nếu cookie có tên 'firstNameCookie' tồn tại -> Hiển thị lời chào
    --%>
    <c:if test="${cookie.firstNameCookie != null}">
        <p>
            <b>Welcome back, <c:out value="${cookie.firstNameCookie.value}"/>!</b>
        </p>
    </c:if>

    <h1>List of albums</h1>
    
    <p><a href="download?action=checkUser&productCode=8601">86 (the band) - True Life Songs and Pictures</a></p>
    <p><a href="download?action=checkUser&productCode=pf01">Paddlefoot - The First CD</a></p>
    <p><a href="download?action=checkUser&productCode=pf02">Paddlefoot - The Second CD</a></p>
    <p><a href="download?action=checkUser&productCode=jr01">Joe Rut - Genuine Wood Grained Finish</a></p>

</body>
</html>