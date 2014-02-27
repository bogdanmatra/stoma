<!DOCTYPE HTML>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
	<head>
		<tiles:insertAttribute name="meta" />
	</head>
<body class="">
	<header id="header" >
		<tiles:insertAttribute name="header" />
	</header>
	<div id="body" >
		<tiles:insertAttribute name="body" />
	</div>
	<footer id="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>