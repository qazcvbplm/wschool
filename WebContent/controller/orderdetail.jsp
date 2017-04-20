<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
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
              <div class="container thumbnail">
               <div class="row " >
                  <div class="col-md-12" >
                     <label class="col-md-3">订单编号</label>
                     <label class="col-md-3">${order.ordernumber}</label>
                     <label class="col-md-3">${order.time}</label>
                  </div>
              </div>
              </div>
              <h1></h1>
              <div class="container thumbnail">
              <c:forEach items="${order.ops}" var="p">
               <div class="row " >
                  <div class="col-md-12" >
                     <label class="col-md-3">${p.product.name}</label>
                     <label class="col-md-3">x${p.count}</label>
                      <label class="col-md-3">${p.total}</label>
                  </div>
              </div>
              </c:forEach>
              </div>
              
              <div class="container thumbnail">
	               <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">收货人姓名</label>
	                     <label class="col-md-3">${order.addressname}</label>
	                  </div>
	              </div>
	              <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">详细地址</label>
	                     <label class="col-md-3">${order.addressdetail}</label>
	                  </div>
	              </div>
	               <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">联系电话</label>
	                     <label class="col-md-3">${order.addressphone}</label>
	                  </div>
	              </div>
              </div>
              
               <div class="container thumbnail">
                   <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">餐盒费</label>
	                     <label class="col-md-3">${order.boxprice }</label>
	                  </div>
	              </div>
	               <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">配送费</label>
	                     <label class="col-md-3">${order.sendprice}</label>
	                  </div>
	              </div>
	               <div class="row" >
	                  <div class="col-md-12" >
	                     <label class="col-md-3">总计</label>
	                     <label class="col-md-3" style="color:#ff0000">${order.totalprice }元</label>
	                  </div>
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
  </body>
</html>
