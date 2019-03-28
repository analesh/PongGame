<%@page import="com.bloodbank.patient.PatientDao"%>
<%@page import="com.bloodbank.patient.PatientDto"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDao"%>
<%@page import="com.bloodbank.bloodbank.BloodbankDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>HTML to API - Invoice</title>
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<!-- <link rel="stylesheet" href="sass/main.css" media="screen" charset="utf-8"/> -->
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta http-equiv="content-type" content="text-html; charset=utf-8">
	<link type="text/css" href="css/reciept.css" rel="stylesheet">
</head>

<body>
<%@include file="navBar.html" %>
<%
System.out.println(session.getAttribute("bloodbank_id"));

BloodbankDao dao  =new BloodbankDao();
BloodbankDto dto = dao.getBloodbank((int)session.getAttribute("bloodbank_id"));


PatientDao pdao =   new PatientDao();
PatientDto pdto  = pdao.getPatient((int)session.getAttribute("patient_id"));
%>
	<header class="clearfix">
		<div class="container">
			<figure>
				<img class="logo" src="data:image/svg+xml;charset=utf-8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjxzdmcgd2lkdGg9IjM5cHgiIGhlaWdodD0iMzFweCIgdmlld0JveD0iMCAwIDM5IDMxIiB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnNrZXRjaD0iaHR0cDovL3d3dy5ib2hlbWlhbmNvZGluZy5jb20vc2tldGNoL25zIj4KICAgIDwhLS0gR2VuZXJhdG9yOiBTa2V0Y2ggMy40LjEgKDE1NjgxKSAtIGh0dHA6Ly93d3cuYm9oZW1pYW5jb2RpbmcuY29tL3NrZXRjaCAtLT4KICAgIDx0aXRsZT5ob21lNDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxkZWZzPjwvZGVmcz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHNrZXRjaDp0eXBlPSJNU1BhZ2UiPgogICAgICAgIDxnIGlkPSJJTlZPSUNFLTEiIHNrZXRjaDp0eXBlPSJNU0FydGJvYXJkR3JvdXAiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC00Mi4wMDAwMDAsIC00NS4wMDAwMDApIiBmaWxsPSIjRkZGRkZGIj4KICAgICAgICAgICAgPGcgaWQ9IlpBR0xBVkxKRSIgc2tldGNoOnR5cGU9Ik1TTGF5ZXJHcm91cCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzAuMDAwMDAwLCAxNS4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxnIGlkPSJob21lNCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTIuMDAwMDAwLCAzMC4wMDAwMDApIiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIj4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMzguMjc5MzM1LDE0LjAzOTk1MiBMMzIuMzc5MDM3OCw5LjAxMjMzODM1IEwzMi4zNzkwMzc4LDMuMjA0MzM2NzQgQzMyLjM3OTAzNzgsMi4xNTQ0MTY1MyAzMS4zODA1NTkyLDEuMzAzMjk3MjggMzAuMTQ2MDE3NiwxLjMwMzI5NzI4IEMyOC45MTQ2MTk2LDEuMzAzMjk3MjggMjcuOTE2MTQxMSwyLjE1NDQxNjUzIDI3LjkxNjE0MTEsMy4yMDQzMzY3NCBMMjcuOTE2MTQxMSw1LjIwOTMzODY1IEwyMy41MjI2OTc3LDEuNDY1NzY5OTggQzIxLjM1MDM4NzksLTAuMzgzODc0MjAyIDE3LjU3MzY3NTEsLTAuMzgwNjA5NjggMTUuNDA2NjcsMS40NjkwMzQ1IEwwLjY1MzA3ODA4NiwxNC4wMzk5NTIgQy0wLjIxNzU5NDQ1OCwxNC43ODM1MDk1IC0wLjIxNzU5NDQ1OCwxNS45ODY3Nzg1IDAuNjUzMDc4MDg2LDE2LjcyODk5NjYgQzEuNTI0NjM0NzYsMTcuNDcyNTU0MSAyLjkzOTQ0MDgxLDE3LjQ3MjU1NDEgMy44MTAxMTMzNSwxNi43Mjg5OTY2IEwxOC41NjIxMzM1LDQuMTU4MDc5MTUgQzE5LjA0MzAwMjUsMy43NTA2ODM2NSAxOS44ODk5MDE4LDMuNzUwNjgzNjUgMjAuMzY4MDIwMiw0LjE1NjgyMzU2IEwzNS4xMjIyOTk3LDE2LjcyODk5NjYgQzM1LjU2MDE0MTEsMTcuMTAwNzMzNSAzNi4xMzA0MDU1LDE3LjI4NTgwNjcgMzYuNzAwNjcsMTcuMjg1ODA2NyBDMzcuMjcyMDE1MSwxNy4yODU4MDY3IDM3Ljg0MzQ1ODQsMTcuMTAwNzMzNSAzOC4yNzk3MjgsMTYuNzI4OTk2NiBDMzkuMTUwNzkzNSwxNS45ODY3Nzg1IDM5LjE1MDc5MzUsMTQuNzgzNTA5NSAzOC4yNzkzMzUsMTQuMDM5OTUyIEwzOC4yNzkzMzUsMTQuMDM5OTUyIFoiIGlkPSJGaWxsLTEiPjwvcGF0aD4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAuMjQxMzkyOSw3Ljc2Njk2NTM5IEMxOS44MTI3ODU5LDcuNDAyMDA4NjcgMTkuMTE4OTM5NSw3LjQwMjAwODY3IDE4LjY5MTUxMTMsNy43NjY5NjUzOSBMNS43MTQyMzY3OCwxOC44MjEzMDM2IEM1LjUwOTMxNDg2LDE4Ljk5NTU3ODggNS4zOTMzOTU0NywxOS4yMzM5NzI1IDUuMzkzMzk1NDcsMTkuNDgyNDEwOSBMNS4zOTMzOTU0NywyNy41NDUzNTk2IEM1LjM5MzM5NTQ3LDI5LjQzNzE5MTQgNy4xOTM1ODQzOCwzMC45NzEwMTQxIDkuNDEzODMzNzUsMzAuOTcxMDE0MSBMMTUuODM4NzE1NCwzMC45NzEwMTQxIEwxNS44Mzg3MTU0LDIyLjQ5MjU1MDUgTDIzLjA5MjUxODksMjIuNDkyNTUwNSBMMjMuMDkyNTE4OSwzMC45NzEwMTQxIEwyOS41MTc4OTE3LDMwLjk3MTAxNDEgQzMxLjczODE0MTEsMzAuOTcxMDE0MSAzMy41MzgyMzE3LDI5LjQzNzE5MTQgMzMuNTM4MjMxNywyNy41NDUzNTk2IEwzMy41MzgyMzE3LDE5LjQ4MjQxMDkgQzMzLjUzODIzMTcsMTkuMjMzOTcyNSAzMy40MjMwOTgyLDE4Ljk5NTU3ODggMzMuMjE3NDg4NywxOC44MjEzMDM2IEwyMC4yNDEzOTI5LDcuNzY2OTY1MzkgWiIgaWQ9IkZpbGwtMyI+PC9wYXRoPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4=" alt="">
			</figure>
			<div class="company-address">
				<h2 class="title"><%=dto.getBloodbank_name()%></h2>
				<p>
					<%=dto.getAddress() %><br>
					<%=dto.getCity() %>,<%=dto.getCountry() %>
				</p>
			</div>
			<div class="company-contact">
				<div class="phone left">
					<span class="circle"><img src="data:image/svg+xml;charset=utf-8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNS4xLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zOnNrZXRjaD0iaHR0cDovL3d3dy5ib2hlbWlhbmNvZGluZy5jb20vc2tldGNoL25zIg0KCSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjkuNzYycHgiIGhlaWdodD0iOS45NThweCINCgkgdmlld0JveD0iLTQuOTkyIDAuNTE5IDkuNzYyIDkuOTU4IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IC00Ljk5MiAwLjUxOSA5Ljc2MiA5Ljk1OCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8dGl0bGU+RmlsbCAxPC90aXRsZT4NCjxkZXNjPkNyZWF0ZWQgd2l0aCBTa2V0Y2guPC9kZXNjPg0KPGcgaWQ9IlBhZ2UtMSIgc2tldGNoOnR5cGU9Ik1TUGFnZSI+DQoJPGcgaWQ9IklOVk9JQ0UtMSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTMwMS4wMDAwMDAsIC01NC4wMDAwMDApIiBza2V0Y2g6dHlwZT0iTVNBcnRib2FyZEdyb3VwIj4NCgkJPGcgaWQ9IlpBR0xBVkxKRSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMzAuMDAwMDAwLCAxNS4wMDAwMDApIiBza2V0Y2g6dHlwZT0iTVNMYXllckdyb3VwIj4NCgkJCTxnIGlkPSJLT05UQUtUSSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMjY3LjAwMDAwMCwgMzUuMDAwMDAwKSIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+DQoJCQkJPGcgaWQ9Ik92YWwtMS1feDJCXy1GaWxsLTEiPg0KCQkJCQk8cGF0aCBpZD0iRmlsbC0xIiBmaWxsPSIjOEJDMzRBIiBkPSJNOC43NjUsMTIuMzc1YzAuMDIsMC4xNjItMC4wMjgsMC4zMDMtMC4xNDMsMC40MjJMNy4yNDYsMTQuMTkNCgkJCQkJCWMtMC4wNjIsMC4wNy0wLjE0MywwLjEzMy0wLjI0MywwLjE4MmMtMC4xMDEsMC4wNDktMC4xOTcsMC4wOC0wLjI5NSwwLjA5NGMtMC4wMDcsMC0wLjAyOCwwLTAuMDYyLDAuMDA0DQoJCQkJCQljLTAuMDM0LDAuMDA1LTAuMDgsMC4wMDgtMC4xMzQsMC4wMDhjLTAuMTMxLDAtMC4zNDMtMC4wMjMtMC42MzUtMC4wNjhjLTAuMjkzLTAuMDQ1LTAuNjUxLTAuMTU4LTEuMDc2LTAuMzM2DQoJCQkJCQljLTAuNDI0LTAuMTgyLTAuOTA0LTAuNDUxLTEuNDQyLTAuODA5Yy0wLjUzNi0wLjM1Ny0xLjEwOS0wLjg1Mi0xLjcxNi0xLjQ3OWMtMC40ODEtMC40ODQtMC44OC0wLjk1LTEuMTk4LTEuMzkzDQoJCQkJCQlDMC4xMjgsOS45NS0wLjEyNSw5LjU0MS0wLjMxOSw5LjE2NGMtMC4xOTMtMC4zNzYtMC4zMzgtMC43MTctMC40MzQtMS4wMjNjLTAuMDk3LTAuMzA2LTAuMTYxLTAuNTctMC4xOTUtMC43OTINCgkJCQkJCWMtMC4wMzUtMC4yMjEtMC4wNS0wLjM5NC0wLjA0Mi0wLjUyMWMwLjAwNy0wLjEyNiwwLjAxLTAuMTk3LDAuMDEtMC4yMTFjMC4wMTQtMC4wOTksMC4wNDQtMC4xOTgsMC4wOTMtMC4zMDENCgkJCQkJCWMwLjA0OS0wLjEwMSwwLjEwOC0wLjE4NCwwLjE3Ni0wLjI0N2wxLjM3NS0xLjQwM2MwLjA5Ny0wLjA5OCwwLjIwNi0wLjE0NywwLjMzLTAuMTQ3YzAuMDksMCwwLjE2OSwwLjAyNiwwLjIzOCwwLjA3OQ0KCQkJCQkJQzEuMyw0LjY0OCwxLjM1OSw0LjcxNCwxLjQwNiw0Ljc5MWwxLjEwNiwyLjE0MWMwLjA2MiwwLjExNCwwLjA4LDAuMjM1LDAuMDUyLDAuMzdDMi41MzgsNy40MzYsMi40NzgsNy41NDgsMi4zODksNy42NA0KCQkJCQkJTDEuODgzLDguMTU3QzEuODY5LDguMTcxLDEuODU2LDguMTk0LDEuODQ2LDguMjI2QzEuODM1LDguMjU2LDEuODMsOC4yODMsMS44Myw4LjMwNGMwLjAyNywwLjE0NywwLjA5LDAuMzE3LDAuMTg3LDAuNTA3DQoJCQkJCQljMC4wODIsMC4xNjksMC4yMSwwLjM3NSwwLjM4MiwwLjYxOGMwLjE3MiwwLjI0MywwLjQxNywwLjUyMSwwLjczNCwwLjgzOWMwLjMxMSwwLjMyMiwwLjU4NSwwLjU3NCwwLjgyOCwwLjc1NQ0KCQkJCQkJYzAuMjQsMC4xNzgsMC40NDMsMC4zMDksMC42MDQsMC4zOTVjMC4xNjIsMC4wODUsMC4yODYsMC4xMzUsMC4zNzIsMC4xNTRsMC4xMjgsMC4wMjRjMC4wMTUsMCwwLjAzOC0wLjAwNiwwLjA2Ny0wLjAxNg0KCQkJCQkJYzAuMDMyLTAuMDEsMC4wNTQtMC4wMjEsMC4wNjctMC4wMzdsMC41ODgtMC42MTJjMC4xMjUtMC4xMTIsMC4yNy0wLjE2OCwwLjQzNi0wLjE2OGMwLjExNywwLDAuMjA3LDAuMDIxLDAuMjc3LDAuMDYxaDAuMDENCgkJCQkJCWwxLjk5NSwxLjIwM0M4LjY1MSwxMi4xMiw4LjczNywxMi4yMzQsOC43NjUsMTIuMzc1TDguNzY1LDEyLjM3NXoiLz4NCgkJCQk8L2c+DQoJCQk8L2c+DQoJCTwvZz4NCgk8L2c+DQo8L2c+DQo8L3N2Zz4NCg==" alt=""><span class="helper"></span></span>
					<a href=""><%=dto.getMno() %></a>
					<span class="helper"></span>
				</div>
				<div class="email right">
					<span class="circle"><img src="data:image/svg+xml;charset=utf-8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNS4xLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zOnNrZXRjaD0iaHR0cDovL3d3dy5ib2hlbWlhbmNvZGluZy5jb20vc2tldGNoL25zIg0KCSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjE0LjE3M3B4Ig0KCSBoZWlnaHQ9IjE0LjE3M3B4IiB2aWV3Qm94PSIwLjM1NCAtMi4yNzIgMTQuMTczIDE0LjE3MyIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwLjM1NCAtMi4yNzIgMTQuMTczIDE0LjE3MyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSINCgk+DQo8dGl0bGU+ZW1haWwxOTwvdGl0bGU+DQo8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4NCjxnIGlkPSJQYWdlLTEiIHNrZXRjaDp0eXBlPSJNU1BhZ2UiPg0KCTxnIGlkPSJJTlZPSUNFLTEiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC00MTcuMDAwMDAwLCAtNTUuMDAwMDAwKSIgc2tldGNoOnR5cGU9Ik1TQXJ0Ym9hcmRHcm91cCI+DQoJCTxnIGlkPSJaQUdMQVZMSkUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMwLjAwMDAwMCwgMTUuMDAwMDAwKSIgc2tldGNoOnR5cGU9Ik1TTGF5ZXJHcm91cCI+DQoJCQk8ZyBpZD0iS09OVEFLVEkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI2Ny4wMDAwMDAsIDM1LjAwMDAwMCkiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPg0KCQkJCTxnIGlkPSJPdmFsLTEtX3gyQl8tZW1haWwxOSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTE3LjAwMDAwMCwgMC4wMDAwMDApIj4NCgkJCQkJPHBhdGggaWQ9ImVtYWlsMTkiIGZpbGw9IiM4QkMzNEEiIGQ9Ik0zLjM1NCwxNC4yODFoMTQuMTczVjUuMzQ2SDMuMzU0VjE0LjI4MXogTTEwLjQ0LDEwLjg2M0w0LjYyNyw2LjAwOGgxMS42MjZMMTAuNDQsMTAuODYzDQoJCQkJCQl6IE04LjEyNSw5LjgxMkw0LjA1LDEzLjIxN1Y2LjQwOUw4LjEyNSw5LjgxMnogTTguNjUzLDEwLjI1M2wxLjc4OCwxLjQ5M2wxLjc4Ny0xLjQ5M2w0LjAyOSwzLjM2Nkg0LjYyNEw4LjY1MywxMC4yNTN6DQoJCQkJCQkgTTEyLjc1NSw5LjgxMmw0LjA3NS0zLjQwM3Y2LjgwOEwxMi43NTUsOS44MTJ6Ii8+DQoJCQkJPC9nPg0KCQkJPC9nPg0KCQk8L2c+DQoJPC9nPg0KPC9nPg0KPC9zdmc+DQo=" alt=""><span class="helper"></span></span>
					<a href=""><%=dto.getEmail() %></a>
					<span class="helper"></span>
				</div>
			</div>
		</div>
	</header>

	<section>
		<div class="container">
			<div class="details clearfix">
				<div class="client left">
					<p>INVOICE TO:</p>
					<p class="name"><%=pdto.getName()%></p>
					<p><%=pdto.getHospital()%></p>
					<p><%=pdto.getMno()%></p>
				</div>
				<div class="data right">
					<div class="title">Invoice 3-2-1</div>
					<div class="date">
						Date of Invoice: 01/06/2014<br>
						Due Date: 30/06/2014
					</div>
				</div>
			</div>

			<table border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th class="desc">Blood group</th>
						<th class="qty">Quantity</th>
						<th class="unit">Unit price</th>
						<th class="total">Total</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="desc"><%=session.getAttribute("blood_group") %></td>
						<td class="qty"><%=session.getAttribute("quantity") %></td>
						<td class="unit"><%=session.getAttribute("cost")%></td>
						<td class="total"><%=session.getAttribute("price") %></td>
					</tr>
					
				</tbody>
			</table>
			<div class="no-break">
				<table class="grand-total">
					<tbody>
						
						
						<tr>
							<td class="desc"></td>
							<td class="unit" colspan="2">GRAND TOTAL:</td>
							<td class="total">Rs.<%=session.getAttribute("price") %></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<div class="thanks">Thank you!</div>
			<input type="submit" value="download">
			
			<div class="end">Invoice was created on a computer and is valid without the signature and seal.</div>
		</div>
	</footer>

</body>
<%session = null;%>
</html>