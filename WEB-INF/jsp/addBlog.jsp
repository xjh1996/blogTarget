<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addBlog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
 
	<script type="text/javascript">
		
	</script>
  </head>
<body>
	<form action="<%=path %>" method="post" id="mainblog" name="mainblog"  onsubmit="checkInput()">
		标题<input type="text" name="title"/><br><br>
		类别<input type="text" name="typename"/><br><br>
		<input name="content" type="hidden" id="content">
		<input type="button" onclick="checkInput()" value="提交"> 	
	</form>
	<script id="editor" type="text/plain" style="width:1024px;height:500px;">${blog.content}</script>
	<script type="text/javascript">
	    //实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');   
	</script>
    
    <script type="text/javascript">
	function checkInput(id){
				 if($("input[name='title']").val()==""){
				 	alert("标题不得为空");
				 	return false;
				 }
				 if($("input[name='typename']").val()==""){
				 	alert("类型不得为空");
				 	return false;
				 }
				if (!UE.getEditor('editor').hasContents()){
					alert('请先填写内容!');
					return false;
				}
				document.mainblog.content.value=UE.getEditor('editor').getContent();
				 console.log(document.mainblog.content.value);
				 $.ajax({
	                cache: true,
	                type: "POST",
	                url:'<%=path %>/post',
	                data:$('#mainblog').serialize(),// 你的formid
	                async: false,
	                error: function(request) {
	                    alert("添加失败");
	                },
	                success: function(data) {
	                	alert("添加成功");
	                    window.location.href="<%=basePath%>manager"
	                }
	            });
				 return true;
			}
		</script>
  </body>
</html>
