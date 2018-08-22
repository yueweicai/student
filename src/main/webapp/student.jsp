<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生信息表</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="container" id="app">
		<div class="form-group">
			<label class="control-label">学生姓名</label>
			<input placeholder="学生姓名" class="form-control">
		</div>
		<div class="form-group">
			<label class="control-label">学生性别</label>
			<select class="form-control">
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label">出生日期</label>
			<input type="date" class="form-control">
		</div>
		<div class="form-group">
			<label class="control-label">民族</label>
			<select class="form-control">
				<option value="汉族">汉族</option>
				<option value="满族">满族</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label">省份</label>
			<select class="form-control">
				<option value="河北">河北</option>
				<option value="河男">河南</option>
			</select>
		</div>
		<div class="form-group">
			<label class="control-label">身份证号码</label>
			<input class="form-control" placeholder="请输入身份证号码">
		</div>
		<div class="form-group">
			<label class="control-label">联系电话</label>
			<input class="form-control" placeholder="请输入联系电话">
		</div>
		<div class="form-group">
			<label class="control-label">家庭住址</label>
			<input class="form-control" placeholder="请输入家庭住址">
		</div>
		<div class="form-group text-right">
			<button class="btn btn-default">重置</button>
			<button class="btn btn-primary">保存</button>
		</div>
	</div>
</body>
</html>