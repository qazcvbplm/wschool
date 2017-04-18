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
      <section id="main-content" >
          <section class="wrapper" >
              <!-- 数据区段-->
              <div class="row" >
                  <div class="col-lg-12" >
                    <h1></h1>
                     <form action="updateproduct.do" class="form-horizontal" enctype="multipart/form-data" method="post">
                        <input type="hidden" value="${sessionScope.classesid}" name="classesid">
                        <input type="hidden" value="${product.id}" name="id">
                        <input type="file" onchange="change()" name="pic" style="display:none"> 
                          <div class="form-group">
                              <label class="control-label col-md-1">商品名字</label>
                               <div class="col-md-2">
                              <input class="form-control" type="text" name="name" value="${product.name}" required />
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-1">商品编号</label>
                              <div class="col-md-2">
                              <input class="form-control" type="text" name="code"  value="${product.code}" required />
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="control-label col-md-1">商品图片</label>
                              <div onclick="image()" class="col-md-2 text-center">
                                   <input type="hidden" value="${product.imagec.id}" name="image">
                                   <img  width="100px" height="100px"   src="${product.imagec.url}" alt="点击上传" >
                               </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-1">商品售价</label>
                               <div class="col-md-2">
                              <input class="form-control" type="text" value="${product.price}" onkeyup="if( ! /^\d*(?:\.\d{0,2})?$/.test(this.value)){this.value='';}"  name="price"   required />
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="control-label col-md-1">商品库存</label>
                               <div class="col-md-2">
                              <input class="form-control" type="number" value="${product.number}" name="number" required />
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="control-label col-md-1">商品库存</label>
                               <div class="col-md-2">
                              <input class="form-control" type="number" value="${product.sales}" name="sales" required />
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="control-label col-md-1">上架状态</label>
                               <div class="col-md-2">
                               <c:if test="${product.type eq 1 }">
                                 <input class="form-control" type="checkbox" name="type"  checked="true"/>
                              </c:if>
                               <c:if test="${product.type eq 0 }">
                                 <input class="form-control" type="checkbox" name="type"  />
                              </c:if>
                              </div>
                          </div>
                          <h1></h1>
                              <div class="col-md-4 text-center">
                             <button type="submit" class="btn btn-success"  >提交</button>                          
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
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
    <script src="js/common-scripts.js"></script>
    <script src="js/dynamic-table.js"></script>
<script>
var file=$("input[name='pic']");
		
  function image(){
	  file.click();
  }
  
  function change()
  {
	  var f=document.querySelector("input[type='file']");
	  var filereader=new FileReader();
	     filereader.addEventListener("load",function(e){
	    	   $("img").attr("src",e.target.result);
	     });
	     filereader.readAsDataURL(f.files[0]);
  }

</script>

  </body>
</html>
