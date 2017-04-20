<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
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
              <h1></h1>
              <form action="findordersall.do">
              <div class="container thumbnail">
	              <div class="row">
	                 <div class="col-md-12">
	                     <h3>时间段</h3>
	                 </div>
	              </div>
	              <div class="row">
	                 <div class="col-md-3">
	                     <input class="form-control" id="st" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})"   name="starttime" />
	                 </div>
	                 <div class="col-md-1">
	                   ------
	                 </div>
	                 <div class="col-md-3">
	                     <input class="form-control" id="et" class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})"  name="endtime" />
	                 </div>
	              </div>
	              <div class="row">
	                 <div class="col-md-12">
	                     <h3>店铺</h3>
	                 </div>
	              </div>
	               <div class="row">
	                 <div class="col-md-4">
	                     <select class="form-control" name="shopid"></select>
	                 </div>
	                 <div class="col-md-2">
	                     <select class="form-control" name="type">
	                     <option value="0">待支付</option>
	                      <option value="1">待接手</option>
	                       <option value="2">待确认</option>
	                        <option value="3">成功</option>
	                     </select>
	                 </div>
	                 <div class="col-md-6">
	                     <button type="submit" class="btn btn-success" >查询</button>
	                 </div>
	              </div>
	          </div>
	          </form>
	           <div style="display:none"  id='canvasDiv'></div>
	           <div style="display:none" id="tabl" class="container thumbnail" style="display:none">
	               <table class="table table-striped border-top" id="sample_1">
                          <thead>
                          <tr style="display:none">
	                            <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
	                            <th class="hidden-phone">订单编号</th>
                                <th class="hidden-phone">收货人姓名</th>
                                <th class="hidden-phone">收货人电话</th>
                                <th class="hidden-phone">状态</th>
                                <th class="hidden-phone">实际总价</th>
                                <th class="hidden-phone">订单时间</th>
                                <th class="hidden-phone">操作</th>
                          </tr>
                          </thead>
                          <tbody style="display:none" id="ap">
                              <td><input type="checkbox" class="checkboxes" value="1" /></td>
                          </tbody>
                    </table>
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
     <script src="js/WdatePicker.js"></script>
       <script type="text/javascript" src="js/ichart.1.2.min.js"></script>
        <script type="text/javascript" src="js/tzh.js"></script>
    <script>
      $(document).ready(function(){
    	     $.ajax({
    	    	 url:'shoplistajax.do',
    	    	 dataType:'json',
    	    	 success:function(data){
    	    		 $("select[name='shopid']").html("");
    	    		 for(var i=0;i<data.length;i++)
    	    			 {
    	    			 if(data[i].sid==1)
       	    			  $("select[name='shopid']").html( $("select[name='shopid']").html()+"<option value='"+data[i].id+"'>"+data[i].name+"(湖北经济学院)</option>");
       	    			 else
          	    			  $("select[name='shopid']").html( $("select[name='shopid']").html()+"<option value='"+data[i].id+"'>"+data[i].name+"(江西理工大学)</option>");
    	    			 }
    	    	 }
    	     })
    	   
      });
				function cx(){
					$("#tabl").slideDown('2000');
					  $("#ddzs").html("");
	        		  $("#psf").html("");
	        		  $("#xse").html("");
					var st=$("#st").val();
					var et=$("#et").val();
					var shopid=$("select[name='shopid']").val();
				          $.ajax({
				        	  url:'adminindex.do?st='+st+'&et='+et+'&shopid='+shopid,
				        	  dataType:'json',
				        	  success:function(data){
				        		  dra(data.data);
				        		  $("#ddzs").html("订单总数："+data.ddzs);
				        		  $("#psf").html( "配送费："+data.psf+"元");
				        		  $("#xse").html( "销售额："+data.xse+"元");
				        		   for(var i=0;i<data.orders.length;i++)
					        		{
					        			      $("#ap").append(
					        			    		  '<tr class="odd gradeX"><td><input type="checkbox" class="checkboxes" value="1" /></td>'+
					 	                              '<td>'+data.orders[i].ordernumber+'</td>'+
					 	                              '<td class="hidden-phone">'+data.orders[i].addressname+'</td>'+
					 	                              '<td class="hidden-phone">'+data.orders[i].addressphone+'</td>'+
	                                                   '<td class="hidden-phone">交易完成</td>'+
					        			    		   '<td class="hidden-phone">'+data.orders[i].totalprice+'</td>'+
						                               '<td class="hidden-phone">'+data.orders[i].time+'</td>'+
						                               '<td class="hidden-phone"><a class="btn btn-primary" href="ordersdetail.do?id='+data.orders[i].id+'">详情</a>&nbsp;<a class="btn btn-success">完成</a></td></tr>'
					        			    		  );
					        	    } 
				        		 
				        	  }
				          });   	
					
				}
				
				 function dra(data){
		    		 
		    		 var max=data[0].value;
		    		 for(var i=0;i<data.length;i++)
		    		{
		    			if(data[i].value>max)
		    			{
		    				max=data[i].value;
		    			}
		    		}
		    		var  chart = new iChart.Column3D({
		    			render : 'canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
		    			data: data,//绑定数据
		    			title : '订单统计图',//设置标题
		    			width : document.querySelector("#main-content").offsetWidth-30,//设置宽度，默认单位为px
		    			height : 400,//设置高度，默认单位为px
		    			shadow:true,//激活阴影
		    			shadow_color:'#c7c7c7',//设置阴影颜色
		    			animation:true,
		    			coordinate:{//配置自定义坐标轴
		    				scale:[{//配置自定义值轴
		    					 position:'left',//配置左值轴	
		    					 start_scale:0,//设置开始刻度为0
		    					 end_scale:max+2,//设置结束刻度为26
		    					 scale_space:max,//设置刻度间距
		    					 listeners:{//配置事件
		    						parseText:function(t,x,y){//设置解析值轴文本
		    							return {text:"订单数"}
		    						}
		    					}
		    				}]
		    			}
		    		});
		    		//调用绘图方法开始绘图
		    		 chart.draw();
		    	};
    </script>
     <script src="js/common-scripts.js"></script>
  </body>
</html>
