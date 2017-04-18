<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description"  >
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   <!--  <link href="css/bootstrap-reset.css" rel="stylesheet"> -->
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <style>
   input
		{
		color:#000000;
		}
    </style>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  <section id="container" class="">
    <!--header start-->
        <%@ include file="head.jsp" %>
      <!--header end-->
      <!--left nav-->
     <%@ include file="left.jsp" %>
      <!--sidebar end-->
       <!--main content start-->
     <!--main content start-->
      <section id="main-content" >
          <section class="wrapper" >
              <!-- 数据区段-->
		              <div class="container-fluid">
		        <!--tabs-left:选项卡在左边显示  -->
		        <div class="tabbable">
		            <!--nav-pills，nav-tabs，nav-stacked :改变选项卡的样式-->
		            <ul class="nav nav-tabs">
		                <li class="active"><a href="#tab1" data-toggle="tab">基本信息</a>
		                </li>
		            </ul>
		            <!-- 选项卡相对应的内容 -->
		            <form action="updatepass.do?id=${sessionScope.admin.id }" class="form-horizontal"  method="post">
			            <div class="tab-content">
			                <div class="tab-pane active" id="tab1" >
			                    <h1></h1>
			                    <div class="col-md-12 text-center">
			                    <div class="form-group">
			                      <label class="control-label col-md-1">用户名</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text" readonly="true" value="${sessionScope.admin.username}" required/>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">密码</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text" min="6"  name="password"  value="${sessionScope.admin.password}"  required/>
			                      </div>
			                    </div>
			                    <h1></h1>
			                    </div>
			                </div>
			            </div>
			         
			           <div class="container-fluid">
			           <h1></h1>
			            <div class="row">
			               <div class="col-md-12 text-center">
			               <button  type="submit" class="btn btn-success" style="width:200px">提交</button>
			               </div>
			            </div>
			            </div>
			        </form>
		        </div>
    </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end--> 
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/common-scripts.js"></script>
    <c:if test="${!empty sessionScope.error}">
      <script>
      var error=${sessionScope.error};
      alert(error);
      </script>
    </c:if> 
  </body>
</html>
