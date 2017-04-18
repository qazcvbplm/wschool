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
			<c:if test="${!empty error}">
				  <script>
					  var msg="${error}";
					  alert(msg);
				  </script>
			</c:if>
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
              <!-- 数据区段-->
              <div class="row">
                  <div class="col-lg-12">
                      <div class="col-lg-2" align="center">
                         <button id="filebtn1" onclick="fileup()" class="btn btn-success">本地上传</button>
                         <form id="form" action="addimage.do"  enctype="multipart/form-data" method="post">
                             <input id="filebtn2"  type="file" style="display:none" name="image">
                         </form>
                      </div>
                      <div class="col-lg-8"></div>
                      <div class="col-lg-2" align="center">
                         <a class="btn btn-danger" onclick="deletep()">删除</a>
                      </div>
                  </div>
              </div>
              <h1></h1>
              <div class="contaniner thumbnail" >
                <div class="row">
                  <div class="col-lg-12">
                  <c:forEach var="pic" items="${sessionScope.plist}" >
	                  <div class="col-lg-2"   onclick="select(${pic.id},this)"  style="background-image:url('${pic.url}');height:150px;background-size:100% 100%;">
	                  </div>
	              </c:forEach>
                  </div>
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
<script>
			var filebtn2=document.querySelector("#filebtn2");
			var form =document.querySelector("#form");
			var darray=new Array();
			function fileup()
			{
				filebtn2.click();
				filebtn2.addEventListener("change", function(e){
					$("#form").submit();
				});
			}
			
			function select(id,zj)
			{
				var a=zj.getElementsByTagName("img");
				if(a.length==0)
					{
				      zj.innerHTML='<img src="img/timg.png" width="30px" height="30px">';
				      darray.push(id);
					}
				else
					{
				     zj.innerHTML="";
				     for(var i=0;i<darray.length;i++)
				    	 {
				    	    if(darray[i]==id)
				    	    {
				    	    	darray.splice(i);
				    	    	break;
				    	    }	
				    	 }
					}
			}
			
			function deletep()
			{
				    if(darray.length>0)
					{
					     window.location.href="imagedelete.do?array="+darray.join();
					}
			}
</script>

  </body>
</html>
