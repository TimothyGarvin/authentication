<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login/Reg</title>
</head>
<body>
	<h1>Welcome!</h1>
	<h3>Join our growing community!</h3>
	<div></div><hr/>
	<h2>Register</h2>
	<form:form action="/register" mode="post" modelAttribute="newUser">
		<div>
			<form:label path="userName">User Name:</form:label>
			<div></div>
			<form:errors path="userName"/>
			<div></div>
			<form:input path="userName"/>
		</div><hr/>
		<div>
			<form:label path="email">Email:</form:label>
			<div></div>
			<form:errors path="email"/>
			<div></div>
			<form:input path="email"/>
		</div><hr/>
		<div>
			<form:label path="password">Password:</form:label>
			<div></div>
			<form:errors path="password"/>
			<div></div>
			<form:input type="password" path="password"/>
		</div><hr/>
		<div>
			<form:label path="confirm">Confirm PW:</form:label>
			<div></div>
			<form:errors path="confirm"/>
			<div></div>
			<form:input type="password" path="confirm"/>
		</div><hr/>
		<div>
			<input type="submit" value="Submit">
		</div>
	</form:form>
	<div></div><hr/>
	<h2>Log in</h2>
	<form:form action="/login" mode="post" modelAttribute="newLogin">
		<div>
			<form:label path="email">Email:</form:label>
			<div></div>
			<form:errors path="email"/>
			<div></div>
			<form:input path="email"/>
		</div><hr/>
		<div>
			<form:label path="password">Password:</form:label>
			<div></div>
			<form:errors path="password"/>
			<div></div>
			<form:input type="password" path="password"/>
		</div><hr/>
		<div>
			<input type="submit" value="Submit">
		</div>
	</form:form>
</body>
</html>