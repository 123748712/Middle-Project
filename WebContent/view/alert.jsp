<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getAttribute("msg") %></title>
</head>
<body>

	<script>
		alert('<%=request.getAttribute("msg") %>');
		history.go(-1);
	</script>

</body>
</html>