<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生信息表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/vue.js"></script>
</head>
<body>
	<div id="app">
		<input v-model="student.xm">
		<input v-model="student.xbbm">
		<input v-model="student.csny">
		<input v-model="student.mz">
		<input v-model="student.lxdh">
		<button @click="save()">保存</button>
	</div>
</body>
<script type="text/javascript">
	var vue = new Vue({
		el:'#app',
		data:{
			student:{}
		},
		methods:{
			save:function(){
				console.log(this.student);
			}
		}
	})
</script>
</html>