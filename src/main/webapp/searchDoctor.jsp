<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<html>
<head><title>Search Doctor</title></head>
<body>
<h2>Search Doctor</h2>
<form action="searchDoctor" method="post">
    <input type="text" name="keyword" placeholder="Enter name, city or qualification" required>
    <input type="submit" value="Search">
</form>
</body>
</html>
