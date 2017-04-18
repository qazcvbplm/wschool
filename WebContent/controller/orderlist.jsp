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
     <link href="css/bootstrap-switch.css" rel="stylesheet" />
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
    
      <section id="main-content">
          <section class="wrapper">
		       <div class="row">
			     <div class="col-md-2">
			     </div>
			    </div> 
		     <h1></h1>
              <!-- 数据区段-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                                                                                                                              订单列表
                          </header>
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr>
                              <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                              <th class="hidden-phone">订单编号</th>
                              <th class="hidden-phone">收货地址</th>
                               <th class="hidden-phone">用户id</th>
                               <th class="hidden-phone">总价</th>
                               <th class="hidden-phone">支付状态</th>
                               <th class="hidden-phone">时间</th>
                               <th class="hidden-phone">详情</th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach var="o" items="${orderlist}">
                          <tr class="odd gradeX">
                              <td><input type="checkbox" class="checkboxes" value="1" /></td>
                              <td>${o.ordernumber}</td>
                              <td class="hidden-phone">${o.address.detail}</td>
                               <th class="hidden-phone">${o.address.user.username}</th>
                               <td class="hidden-phone">${o.totalprice}</td>
                               <c:if test="${o.paystatus==1 }">
                              <td class="hidden-phone" style="color:#00ff00">待接单</td>
                              </c:if>
                                <c:if test="${o.paystatus==0 }">
                              <td class="hidden-phone">未支付</td>
                              </c:if>
                               <c:if test="${o.paystatus==2 }">
                              <td class="hidden-phone" style="color:#00ff00">派送中</td>
                              </c:if>
                               <c:if test="${o.paystatus==3 }">
                              <td class="hidden-phone" style="color:#00ff00">送达</td>
                              </c:if>
                               <c:if test="${o.paystatus==4 }">
                              <td class="hidden-phone" style="color:#00ff00">申请退款</td>
                              </c:if>
                               <td class="hidden-phone">${o.time }</td>
                               <td class="hidden-phone"><a class="btn btn-primary" href="findorderbyid.do?id=${o.id}">详情</a>
                                <c:if test="${o.paystatus==2 }">
                             <a class="btn btn-primary" href="sure.do?id=${o.id}">确认送达</a>
                               </c:if>
                             </td>
                          </tr>
                          </c:forEach>
                          </tbody>
                          </table>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end--> 
      <!--main content end-->
  </section>

     <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
    <script src="js/common-scripts.js"></script>
    <script src="js/dynamic-table.js"></script>


  </body>
</html>
