<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>
<jsp:include page="navbar.jsp" />
<html>
<head><title>Search Patient</title>
</head>
<body>
<h2>Search Patient</h2>
<form action="searchPatient" method="post">
    <input type="text" name="keyword" placeholder="Enter name, city or disease" required>
    <input type="submit" value="Search">
</form>
</body>
</html>
