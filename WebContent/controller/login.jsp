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
    <!--external css-->
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

<style>
.mycenter{
    margin-top: 100px;
    margin-left: auto;
    margin-right: auto;
    height: 350px;
    width:500px;
}
.mycenter mysign{
    width: 440px;
}
.mycenter input,checkbox,button{
    margin-top:2%;
}
</style>
  <body>

  <section id="container" class="">
    <!--header start-->
        <%@ include file="head2.jsp" %>
      <!--header end-->
      <!--left nav-->
      <!--sidebar end-->
       <!--main content start-->
     <!--main content start-->
    
      <section id="main-content" >
          <section class="wrapper" >
              <!-- 数据区段-->
              <!--  <div class="container text-center">
                    <div class="row">
                        <div class="col-md-12">
                              <form class="form-horizontal" action="login.do" method="post">
                					<h1></h1><h1></h1><h1></h1><h1></h1><h1></h1>
                                       <div class="row">
			                              <div class="col-md-3 col-md-offset-3">
						                          <input class="form-control" type="text" name="username" placeholder="请输入账号"/>
			                              </div>
                                       </div>
                                       <h1></h1>
                                        <div class="row">
			                               <div class="col-md-3 col-md-offset-3">
				                          <input class="form-control" type="password" name="password"  placeholder="请输入密码"/>
				                          </div>
			                          </div>
			                          <h1></h1>
			                           <div class="row col-md-offset-4">
			                              <button type="submit"  class="btn btn-success col-md-3">登录</button>
			                          </div>
			                  </form>
                        </div>
                    </div>
               </div> -->
      <form action="login.do" method="post">
            <div class="mycenter">
            <div class="mysign">
                <div class="col-lg-11 text-center text-info text-center">
                    <c:if test="${empty sessionScope.error}">
                    <h2 id="result">请登录</h2>
                    </c:if>
                     <c:if test="${!empty sessionScope.error}">
                      <h2 style="color:#ff0000" id="result">${sessionScope.error}</h2>
                    </c:if>
                </div>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="username" placeholder="请输入账户名" required />
                </div>
                <div class="col-lg-10"></div>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="password" placeholder="请输入密码" required />
                </div>
                <div class="col-lg-10 text-center"><h5></h5></div>
                <div class="col-lg-10">
                    <button type="submit"  class="btn btn-success col-lg-12">登录</button>
                </div>
            </div>
        </div>
        </form>
              <!-- page end-->
          </section>
      </section>
      <!--main content end--> 
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
  </body>
</html>
