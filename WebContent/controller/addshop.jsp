<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
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
               <!-- 添加分类的模态狂 -->
			   <div class="modal fade" id="mt" tabindex="-1" role="dialog" >
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">添加商品分类</h4>
				      </div>
				      <div class="modal-body">
				             <div classs="form-group">
				                <input type="text" name="classesname" class="form-control" placeholder="请输入分类的名字" required/>
				             </div>
				      </div>
				      <div class="modal-footer">
				        <span id="message"></span>
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" onclick="add()"  class="btn btn-primary">确定</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 添加分类的模态狂 -->
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
		            <form action="addshop.do" class="form-horizontal"  method="post">
			            <div class="tab-content">
			                <div class="tab-pane active" id="tab1" >
			                    <h1></h1>
			                    <div class="container text-center">
			                    <div class="form-group">
			                      <label class="control-label col-md-1">店铺名字</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text"  name="name"  placeholder="黄焖鸡" required/>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">店铺编号</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text"  name="code"  placeholder="01102" required/>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label class="control-label col-md-1">店铺分类</label>
			                      <div class="col-md-4">
			                      <select class="form-control" name="type" required></select>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">电话</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text" name="phone" placeholder="13845614564" required/>
			                      </div>
			                    </div>
			                    <h1></h1>
								   
								 <div class="form-group">
			                      <label  class="control-label col-md-1">开业状态</label>
			                      <div class="col-md-4">
			                        <div class="switch">
			                        <input type="checkbox" name="status" checked/>
			                        </div>
			                      </div>
			                    </div>
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
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="assets/data-tables/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/data-tables/DT_bootstrap.js"></script>
    <script src="js/common-scripts.js"></script>
    <script src="js/dynamic-table.js"></script>

<script>
   $(document).ready(function(){
	   $.ajax({
		   url:'classeslist.do?shopid=0',
				   dataType:'json',
				   success:function(data){
					     for(var i=0;i<data.length;i++)
					    	 {
					    	    $("select").html( $("select").html()+"<option value='"+data[i].id+"'>"+data[i].name+"</option>");
					    	 }
				   }
	   })
   });
</script>
  </body>
</html>
