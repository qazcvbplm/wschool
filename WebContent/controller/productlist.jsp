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
    
      <section id="main-content">
          <section class="wrapper">
		       <div class="row">
			     <div class="col-md-2">
			        <a class="btn btn-success" href="addproduct.jsp">新建商品</a>
			     </div>
			    </div> 
		     <h1></h1>
              <!-- 数据区段-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                                                                                                                              店铺列表
                          </header>
                          <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr>
                              <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                              <th class="hidden-phone">商品名称</th>
                              <th class="hidden-phone">商品编号</th>
                               <th class="hidden-phone">价格</th>
                               <th class="hidden-phone">库存</th>
                                <th class="hidden-phone">销量</th>
                                   <th class="hidden-phone">上架状态</th>
                                <th class="hidden-phone">操作</th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach var="p" items="${sessionScope.plist}">
                          <tr class="odd gradeX">
                              <td><input type="checkbox" class="checkboxes" value="1" /></td>
                              <td>${p.name}</td>
                              <td class="hidden-phone">${p.code}</td>
                               <td class="hidden-phone">${p.price}</td>
                               <td class="hidden-phone">${p.number }</td>
                               <td class="hidden-phone">${p.sales }</td>
                               <c:if test="${p.type==1 }">
                              <td class="hidden-phone"><input type="checkbox"  checked/></td>
                              </c:if>
                                <c:if test="${p.type==0 }">
                              <td class="hidden-phone"><input type="checkbox"  /></td>
                              </c:if>
                              <td class="hidden-phone"><a class="btn btn-success" href="findproductbyid.do?id=${p.id}">编辑</a>&nbsp;<a class="btn btn-danger" href="deleteproduct.do?id=${p.id}">删除</a></td>
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
