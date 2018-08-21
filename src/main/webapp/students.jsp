<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生信息表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript">
	$(function(){
		var vue = new Vue({
			el:'#app',
			data:{
				pages:1,
				page:1,
				list:[]
			},
			methods:{
				query : function(){
					var that = this;
					$.getJSON("student/query",{page:this.page},function(data){
						that.list  = data.list;
						that.pages = data.pages;
					})
				},
				topage : function(n){
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
				    <li @click="topage(1)">
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li v-for="p in pages" @click="topage(p)">
				    	<a href="#">{{p}}</a>
				    </li>
				    <li @click="topage(pages)">
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>