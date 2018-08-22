<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生信息表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript">
	$(function() {
		var vue = new Vue({
			el : '#app',
			data : {
				pages : 1,
				page : 1,
				list : [],
				pros : [ '河北', '河南', '山东', '山西', '湖南', '湖北', '广东', '广西' ],
				mzs : [ '汉族', '满族', '白族', '维吾尔族', '壮族', '土家族', '傣族', '回族' ],
				student : {
					sf : '',
					xm : '',
					xbbm : '',
					mz : ''
				}
			},
			methods : {
				reset : function() {
					this.student = {
						sf : '',
						xm : '',
						xbbm : '',
						mz : ''
					}
				},
				query : function() {
					var that = this;
					$.getJSON("student/query", 
						{
							page : this.page, 
							xm:this.student.xm,
							xbbm:this.student.xbbm,
							sf:this.student.sf,
							mz:this.student.mz
						}, 
						function(data) {
						that.list = data.list;
						that.pages = data.pages;
					})
				},
				topage : function(n) {
					this.page = n;
					this.query();
				}
			}
		});
		vue.query();
	})
</script>
</head>
<body>
	<div class="container" id="app">
		<div class="row" style="margin-top: 15px; margin-bottom: 15px">
			<div class="col-md-3">
				<select v-model="student.sf" class="form-control">
					<option value="">选择省份</option>
					<option v-for="p in pros">{{p}}</option>
				</select>
			</div>
			<div class="col-md-2">
				<input v-model="student.xm" class="form-control" placeholder="请输入姓名">
			</div>
			<div class="col-md-2">
				<select v-model="student.xbbm" class="form-control">
					<option value="">请选择性别</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<div class="col-md-3">
				<select v-model="student.mz" class="form-control">
					<option value="">请选择民族</option>
					<option v-for="m in mzs">{{m}}</option>
				</select>
			</div>
			<div class="col-md-1">
				<button @click="reset" class="btn btn-default btn-block">重置</button>
			</div>
			<div class="col-md-1">
				<button @click="query" class="btn btn-success btn-block">查询</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>生日</th>
								<th>民族</th>
								<th>身份证号码</th>
								<th>电话号码</th>
								<th>省份</th>
								<th>家庭住址</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(stu,i) in list">
								<td>{{i+1}}</td>
								<td>{{stu.xm}}</td>
								<td>{{stu.xbbm}}</td>
								<td>{{stu.csny}}</td>
								<td>{{stu.mz}}</td>
								<td>{{stu.sfzh}}</td>
								<td>{{stu.lxdh}}</td>
								<td>{{stu.sf}}</td>
								<td>{{stu.jtdz}}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<nav id="nav" aria-label="Page navigation">
					<ul class="pagination">
						<li @click="topage(1)"><a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<li v-for="p in pages" @click="topage(p)"><a href="#">{{p}}</a>
						</li>
						<li @click="topage(pages)"><a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>