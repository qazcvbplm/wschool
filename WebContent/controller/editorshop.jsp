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
   <!--  <link href="css/bootstrap-reset.css" rel="stylesheet"> -->
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
<style>
#img:hover{
border: 3px solid #ccc;
}
</style>
  <body>
               <!-- 添加分类的模态狂 -->
			   <div class="modal fade bs-example-modal-lg" id="mt" tabindex="-1" role="dialog" >
				  <div class="modal-dialog modal-lg"  role="document">
				    <div class="modal-content">
				     <!--  <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel">添加商品分类</h4>
				      </div> -->
				      <div class="modal-body" id="main">
				               
				      </div>
				      <div class="modal-footer" id="footer">
				      <div id="foot">
				        <span id="message"></span>
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" onclick="add()"  class="btn btn-primary">确定</button>
				        </div>
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
		                <li><a href="#tab2" data-toggle="tab">营业信息</a>
		                </li>
		                <li><a href="#tab3" data-toggle="tab">店铺图片</a>
		                </li>
		                 <li><a href="#tab4" data-toggle="tab">商品管理</a>
		                </li>
		                 <li><a href="#tab5" data-toggle="tab">商家APP</a>
		                </li>
		            </ul>
		            <!-- 选项卡相对应的内容 -->
		            <form action="updateshop.do?id=${shop.id}" class="form-horizontal" enctype="multipart/form-data" method="post">
			            <div class="tab-content">
			                <div class="tab-pane active" id="tab1" >
			                   <c:if test="${shop.name!='早餐预定' && shop.name!='快递代取'}">
			                    <h1></h1>
			                    <div class="coontainer text-center">
			                    <div class="form-group">
			                      <label class="control-label col-md-1">店铺名字</label>
			                      <div class="col-md-4">
			                      <input class="form-control"  type="text"  name="name"  value="${shop.name }" />
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">店铺编号</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text"  name="code"  value="${shop.code}" />
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label class="control-label col-md-1">店铺分类</label>
			                      <div class="col-md-4">
			                      <select class="form-control" name="type"></select>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">电话</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text" name="phone" value="${shop.phone}" />
			                      </div>
			                    </div>
			                    <h1></h1>
								   
								 <div class="form-group">
			                      <label  class="control-label col-md-1">开业状态</label>
			                      <div class="col-md-4">
			                        <div class="switch">
			                        <c:if test="${shop.status==1 }">
			                        <input type="checkbox" name="status"  checked/>
			                        </c:if>
			                         <c:if test="${shop.status==0}">
			                        <input type="checkbox" name="status"  />
			                        </c:if>
			                        </div>
			                      </div>
			                    </div>
			                    </div>
			                    </c:if>
			                    <c:if test="${shop.name=='早餐预定' || shop.name=='快递代取'}">
			                      <h1></h1>
						                    <div class="coontainer text-center">
						                    <div class="form-group">
						                      <label class="control-label col-md-1">店铺名字</label>
						                      <div class="col-md-4">
						                      <input class="form-control"  type="text" readonly="readonly" name="name"  value="${shop.name }" />
						                      </div>
						                    </div>
						                     <div class="form-group">
						                      <label  class="control-label col-md-1">店铺编号</label>
						                      <div class="col-md-4">
						                      <input class="form-control" type="text"  name="code"  value="${shop.code}" />
						                      </div>
						                    </div>
						                     <div class="form-group">
						                      <label  class="control-label col-md-1">电话</label>
						                      <div class="col-md-4">
						                      <input class="form-control" type="text" name="phone" value="${shop.phone}" />
						                      </div>
						                    </div>
						                    <h1></h1>
											   
											 <div class="form-group">
						                      <label  class="control-label col-md-1">开业状态</label>
						                      <div class="col-md-4">
						                        <div class="switch">
						                        <c:if test="${shop.status==1 }">
						                        <input type="checkbox" name="status"  checked/>
						                        </c:if>
						                         <c:if test="${shop.status==0}">
						                        <input type="checkbox" name="status"  />
						                        </c:if>
						                        </div>
						                      </div>
						                    </div>
						                    </div>
			                    </c:if>
			                </div>
			                <div class="tab-pane text-center" id="tab2">
			                <h1></h1>
			                    <div class="form-group">
			                      <label  class="control-label col-md-1">营业时间1</label>
			                      <div class="col-md-7">
			                      <div class="col-md-3"><input class="form-control" type="time" name="time1" value="${shop.time1 }" /></div>
			                        <div class="col-md-1 text-center">----</div>
			                       <div class="col-md-3"><input class="form-control" type="time" name="time2" value="${shop.time2}"  /></div>
			                      </div>
			                    </div>
			                    <div class="form-group">
			                      <label  class="control-label col-md-1">营业时间2</label>
			                      <div class="col-md-7">
			                      <div class="col-md-3"><input class="form-control" type="time"name="time3" value="${shop.time3}"  /></div>
			                        <div class="col-md-1 text-center">----</div>
			                       <div class="col-md-3"><input class="form-control" type="time" name="time4" value="${shop.time4 }"  /></div>
			                      </div>
			                    </div>
			                    <div class="form-group">
			                      <label  class="control-label col-md-1">营业时间3</label>
			                      <div class="col-md-7">
			                      <div class="col-md-3"><input class="form-control" type="time" name="time5" value="${shop.time5 }"  /></div>
			                        <div class="col-md-1 text-center">----</div>
			                       <div class="col-md-3"><input class="form-control" type="time" name="time6" value="${shop.time6}"  /></div>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">配送时间约</label>
			                      <div class="col-md-2 input-group">
			                      <input class="form-control" type="number" name="arrivetime" value="${shop.arrivetime}"  />
			                      <div class="input-group-addon">分钟</div>
			                      </div>
			                    </div>
			                     <div class="form-group">
			                      <label  class="control-label col-md-1">起送价</label>
			                      <div class="col-md-2 input-group">
			                      <input class="form-control" type="number" name="startprice"  value="${shop.startprice}" />
			                      <div class="input-group-addon">元</div>
			                      </div>
			                        <label  class="control-label col-md-1">餐盒费</label>
			                      <div class="col-md-2 input-group">
			                      <input class="form-control" type="number" name="boxprice" value="${shop.boxprice}" />
			                      <div class="input-group-addon">元</div>
			                      </div>
			                        <label  class="control-label col-md-1">配送费</label>
			                      <div class="col-md-2 input-group">
			                      <input class="form-control" type="number" name="psf" value="${shop.psf}" />
			                      <div class="input-group-addon">元</div>
			                      </div>
			                    </div>
			                  <!--   <div class="form-group ">
			                      <label  class="control-label col-md-1">配送方式一</label>
			                      <div class="col-md-1">
			                      <input class="form-control" type="radio" value="1"  name="sendtype"  checked/>
			                      </div>
			                        <label  class="control-label col-md-1">配送方式二</label>
			                      <div class="col-md-1">
			                      <input class="form-control" type="radio" value="2" name="sendtype"  />
			                      </div>
			                       <label  class="control-label col-md-1">配送方式三</label>
			                      <div class="col-md-1">
			                      <input class="form-control" type="radio" value="3" name="sendtype"  />
			                      </div>
			                    </div> -->
			               </div>
			                    
			                     
			                <div class="tab-pane" id="tab3">
			                 <h1></h1>
			                   <div class="container">
			                      <div class="row text-center" >
			                        <div class="col-md-12">
			                          <a class="btn btn-success" onclick="selectimage()">选择图片</a>
			                          <input type="file" id="filei" name="pic" style="display:none" >
			                          <a class="btn btn-success" onclick="upimage()">上传图片</a>
				                     </div>
			                      </div>
			                      <h1></h1>
			                        <div  class="row text-center">
					                     <div  class="col-md-12" >
					                                <input type="hidden" name="image" value="${shop.image}" />
						                            <img id="show"  width="300px" height="300px" alt="图片预览"  src="${shop.imagec.url}" >
						                </div>
					                </div>
			                   </div>
			                </div>
			                <div class="tab-pane" id="tab4">
			                <h1></h1>
			                    <div class="col-md-12" >
			                        <a class="btn btn-success" onclick="addclasses()">新建分类</a>
			                    </div>
			                    <h1></h1>
					             <table class="table table-striped border-top text-center" >
			                          <tbody id="classlist">
			                          <c:forEach var="c" items="${shop.myclasses}">
			                          <tr class="odd gradeX" id="tr${c.id}">
			                              <td><input type="checkbox" class="checkboxes" value="1" /></td>
			                              <td class="hidden-phone"><label>${c.name}</label></td>
			                              <td><a class="btn btn-success" target="_blank" href="productlist.do?classesid=${c.id}">编辑商品</a></td>
			                              <td><a class="btn btn-danger" onclick="dele(${c.id})">删除</a></td>
			                          </tr>
			                          </c:forEach>
			                          </tbody>
		                          </table>
			                </div>
			                <div class="tab-pane" id="tab5">
			                 <h1></h1>
			                  <input type="hidden" name="appid"  value="${shop.appid }">
			                    <div class="form-group">
			                      <label  class="control-label col-md-1">APP账号</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text" value="${shop.appidc.username}"  name="username"   />
			                      </div>
			                    </div>
			                    <div class="form-group">
			                      <label  class="control-label col-md-1">APP密码</label>
			                      <div class="col-md-4">
			                      <input class="form-control" type="text"  value="${shop.appidc.password}"    name="password"   />
			                      </div>
			                    </div>
			                </div>
			            </div>
			         
			           <div class="container-fluid">
			           <h1></h1>
			            <div class="row">
			               <div class="col-md-12 text-center">
			               <button type="submit"  class="btn btn-success" style="width:200px">保存</button>
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
  <script src="js/tzh.js"></script>
<script>
				var checkid;
				var shopid;
				function upimage(){
					var filei=$("input[type='file']");
					$T.previewI({
						file:'filei',
						show:'show'
					})
					filei.click();
					
				}
	function selectimage()
	{
		$.ajax({
			url:'imagelistajax.do',
					dataType:'json',
					success:function(data){
						  var main= $("#main");
						  main.html("");
						  main.html("<div class='row'>");
						  for(var i=0;i<data.length;i++)
							  {
							     main.html(main.html()+"<div id='img' style='background-image:url(\""+data[i].url+"\");height:100px;background-size:100% 100%;'  onclick='sureselect("+data[i].id+")' class='col-md-3 thumbnail'></div>")
							  }
						  main.html(main.html()+"</div>");
						  $("#mt").modal("show");
						  $("#foot").css("display","none");
							 
					}
		})
	}
	function sureselect(id)
	{
		$("#mt").modal("hide");
		$("input[type='file']").val("");
		$.ajax({
			url:'findimagebyidajax.do?id='+id,
					dataType:'json',
					success:function(data){
						 $("#show").attr("src",data.result);
						 $("input[name='image']").attr("value",id);
					}
		})
	}
	$(document).ready(function(){
		             shopid=${shop.id};
		             checkid=${shop.type};
		   $.ajax({
			   url:'classeslist.do?shopid=0',
					   dataType:'json',
					   success:function(data){
						     for(var i=0;i<data.length;i++)
						    	 {
						    	     if(checkid==data[i].id)
						    	     $("select").html( $("select").html()+"<option selected value='"+data[i].id+"'>"+data[i].name+"</option>");
						    	     else
						    	     $("select").html( $("select").html()+"<option value='"+data[i].id+"'>"+data[i].name+"</option>");
						    	 }
					   }
		   })
	});
   function addclasses()
   {
	   
	   $("#mt").modal("show");
	   $("#main").html( '<input type="text" name="classesname" class="form-control"  required/>');
	   $("#foot").css("display","");
   }
   function add()
   {
	   
	  var name= $("input[name='classesname']").val();
	      if(name.length>0)
		 {
		    $.ajax({
		    	url:'addclasses.do?shopid='+shopid,
		    	data:{name:decodeURI(decodeURI(name))},		
		        dataType:'json',
		        method:'POST',
		        success:function(data){
		        	if(data.result>0)
		        		{
		        		   $("#message").html("添加成功");
		        		   $("input[name='classesname']").val("");
		        		   $("#classlist").append('<tr class="odd gradeX" id="tr'+data.result+'" ><td><input type="checkbox" class="checkboxes" value="1" /></td>'+
		                              '<td class="hidden-phone"><label>'+name+'</label></td>'+
		                              '<td><a class="btn btn-success target="_blank" href="productlist.do?classesid='+data.result+'"    ">编辑商品</a></td>'
		                            	+' <td><a class="btn btn-danger" onclick="dele('+data.result+')">删除</a></td></tr>'	  );
		        		}
		        	    else
		        		{
		        	    	 $("#message").html("添加失败请重试");
		        		}
		          },
		          error:function()
		          {
		        	  $("#message").html("添加失败请重试");
		          }
		    })
		 }
	      else
	     {
				 $("#message").html("分类的名字不能为空");
	     }
   }
   function dele(id)
   {
	   $.ajax({
		   url:'classesdelete.do?classesid='+id,
				   dataType:'json',
				   success:function(data){
					    if(data=='1')
					    	$("#tr"+id).slideUp(100);
				   }
	   })
   }
</script>
  </body>
</html>
