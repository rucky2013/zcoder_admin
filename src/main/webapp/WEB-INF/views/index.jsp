<%--
  Created by IntelliJ IDEA.
  User: lin
  Date: 2016-05-19
  Time: 14:09
  bashboard page
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", -10);
%>
<html ng-app="myapp">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
<%@include file="/WEB-INF/views/common/taglib.jsp"%>
<%@include file="/WEB-INF/views/common/include.jsp"%>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- left menu -->
			<%@include file="/WEB-INF/views/common/leftMenu.jsp"%>
			<!-- /#left menu -->

			<!-- top -->
			<%@include file="/WEB-INF/views/common/head.jsp"%>
			<!-- /#top -->

			<!-- mainframe -->
			<div class="right_col" role="main">
				<iframe id="mainFrame" name="mainFrame" src=""
					style="overflow: visible;" scrolling="no" frameborder="no"
					width="100%" height="100%"></iframe>
			</div>
			<!-- /#mainframe --> 
			
			 <!-- footer content -->
	        <footer>
	          <div class="pull-right">
	            Zcoder - Admin - System
	          </div>
	          <div class="clearfix"></div>
	        </footer>
	        <!-- /footer content -->
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/include-js.jsp"%>
</body>
</html>
