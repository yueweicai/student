<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生信息表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<style type="text/css">
	.msg{
		font-size:16px;font-weight:bolder;text-align:center;
	}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript">
	$(function(){
		var id = '${param.id}';
		
		/**
		//在html页面中获取请求参数的方法
		if(location.href.indexOf("?")>0){
			var ar = location.href.split("?")[1];
			id = ar.split("=")[1];
		}
		**/
		
		var vue = new Vue({
			el:'#app',
			data:{
				student:{
					xbbm:'男',
					sf:'河北',
					mz:'汉族'
				}
			},
			methods:{
				find : function(){
					var that = this;
					$.getJSON("student/find",{id:id},function(data){
						that.student = data;
					});
				},
				save : function(){
					var that = this;
					//验证学生姓名
					var reg1 = /^[\u4e00-\u9fa5]{2,10}$/;
					if(!reg1.test(that.student.xm)){
						$("#xm").removeClass("has-success");
						$("#xm").addClass("has-error");
						return;
					}else{
						$("#xm").removeClass("has-error");
						$("#xm").addClass("has-success");
					}
					
					//验证学生生日
					if(that.student.csny==null){
						$("#csny").removeClass("has-success");
						$("#csny").addClass("has-error");
						return;
					}else{
						$("#csny").removeClass("has-error");
						$("#csny").addClass("has-success");
					}
					
					//验证身份证号码
					var reg2 = /^[0-9]{17}[0-9a-zA-Z]{1}$/;
					if(!reg2.test(that.student.sfzh)){
						$("#sfzh").removeClass("has-success");
						$("#sfzh").addClass("has-error");
						return;
					}else{
						$("#sfzh").removeClass("has-error");
						$("#sfzh").addClass("has-success");
					}
					
					//验证电话号码
					var reg3 = /^(1[0-9]{10}$)|(0[0-9]{2,3}-[0-9]{7,8})$/;
					if(!reg3.test(that.student.lxdh)){
						$("#lxdh").removeClass("has-success");
						$("#lxdh").addClass("has-error");
						return;
					}else{
						$("#lxdh").removeClass("has-error");
						$("#lxdh").addClass("has-success");
					}
					//上述验证规则全部通过，向服务器发送数据
					$.post("student/save",that.student,function(data){
						if(data){
							$(".msg").html("<span style='color:green'>学生信息保存成功，请继续录入！</span>");
							that.student = {
								xbbm:'男',
								sf:'河北',
								mz:'汉族'
							}
							id = null;
							$("#xm,#csny,#lxdh,#sfzh").removeClass("has-success");
						}else{
							$(".msg").html("<span style='color:red'>学生信息保存失败，请重试！</span>");
						}
					})
			
				}
			}
		});
		
		if(id){
			vue.find();
		}
	})
</script>
</head>
<body>
	<div class="container" id="app">
		<div class="form-group" id="xm">
			<label class="control-label">学生姓名</label>
			<input v-model="student.xm" placeholder="学生姓名" class="form-control">
		</div>
		<div class="form-group">
			<label class="control-label">学生性别</label>
			<select v-model="student.xbbm" class="form-control">
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
		</div>
		<div class="form-group" id="csny">
			<label class="control-label">出生日期</label>
			<input v-model="student.csny" type="date" class="form-control">
		</div>
		<div class="form-group">
			<label class="control-label">民族</label>
			<select v-model="student.mz" class="form-control">
				<option value="汉族">汉族</option>
				<option value="满族">满族</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label">省份</label>
			<select v-model="student.sf" class="form-control">
				<option value="河北">河北</option>
				<option value="河男">河南</option>
			</select>
		</div>
		<div class="form-group" id="sfzh">
			<label class="control-label">身份证号码</label>
			<input v-model="student.sfzh" class="form-control" placeholder="请输入身份证号码">
		</div>
		<div class="form-group" id="lxdh">
			<label class="control-label">联系电话</label>
			<input v-model="student.lxdh" class="form-control" placeholder="请输入联系电话">
		</div>
		<div class="form-group">
			<label class="control-label">家庭住址</label>
			<input v-model="student.jtdz" class="form-control" placeholder="请输入家庭住址">
		</div>
		<div class="row">
			<div class="col-md-2">
				<a class="btn btn-default btn-block" href="students.jsp">学生列表</a>
			</div>
			<div class="col-md-8">
				<p class="msg"></p>
			</div>
			<div class="col-md-1">
				<button class="btn btn-default btn-block">重置</button>
			</div>
			<div class="col-md-1">
				<button @click="save()" class="btn btn-primary btn-block">保存</button>
			</div>
		</div>
	</div>
</body>
</html>