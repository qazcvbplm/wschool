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
		            <!--nav-pills，nav-tabs，nav-stacked :改变选项卡的样式-->
		            <!-- 选项卡相对应的内容 -->
		            <form action="updateggw.do" class="form-horizontal"  method="post" enctype="multipart/form-data">
		            <div class="container">
			              <div class="row">
			                       <input type="file" id="file1" name="image" style="display:none">
			                       <input type="file" id="file2" name="image" style="display:none">
			                       <input type="file" id="file3" name="image" style="display:none">
			                       <div class="col-md-12 text-center"  style="height:300px;border:1px #000000 solid;background-image:url('${m1}');background-repeat:no-repeat;background-size:100% 100%"  id="div1" onclick="image(this)">点击上传</div><h1></h1>
			                       <div class="col-md-12 text-center" style="height:300px;border:1px #000000 solid;background-image:url('${m2}');background-repeat:no-repeat;background-size:100% 100%" id="div2" onclick="image(this)">点击上传</div><h1></h1>
			                       <div class="col-md-12 text-center" style="height:300px;border:1px #000000 solid;background-image:url('${m3}');background-repeat:no-repeat;background-size:100% 100%" id="div3" onclick="image(this)">点击上传</div><h1></h1>
			                    </div>
			                    </div>
			                    
			                    <button class="btn btn-success" type="submit">提交</button>
			        </form>
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
  <script>
  function image(it)
  {
 	 var id=$(it).attr("id");
 	 var fileid="";
 	 if(id=='div1')
 		 fileid="file1";
     else if(id=="div2")
     	fileid="file2";
     else
     	fileid="file3";
 	 var fi= $("#"+fileid);
 	fi.click();
 	 //预览图片
 	fi.change(function (){
 		  var filereader=new FileReader();
 		  filereader.addEventListener("load",function(e){
 			  $(it).css("background-image",("url('"+e.target.result+"')"));
 			  $(it).css("background-repeat",("no-repeat"));
 			  $(it).css("background-size",("100% 100%"));
 			 $(it).html("");
   	     });
 		  filereader.readAsDataURL(fi.get(0).files[0]);
 	 });
  }
  </script>
</html>
