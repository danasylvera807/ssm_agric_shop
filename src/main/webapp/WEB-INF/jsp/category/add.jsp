<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/24
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String imgPath = "https://sk308465.oss-cn-hangzhou.aliyuncs.com/";
%>
<html>
<head>
    <title>新增分类</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    
    <input hidden id="categoryId" type="text" name="categoryId" readonly>
       
    <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-block">
            <input id="categoryName" type="text" name="categoryName"  lay-verify="readonly" autocomplete="off" class="layui-input">
        </div>
    </div>
    
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addBtn" type="button" class="layui-btn" >确定</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>

    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;

        $('#addBtn').on('click',function () {
            var categoryId = $('#categoryId').val();
            var categoryName = $('#categoryName').val();
            // 准备要发送的数据
            var requestData = {
                categoryId: categoryId,
                categoryName: categoryName
            };

            // 发送 POST 请求
            $.ajax({
                url: '<%=path%>/category/add.do', // 替换成你的后端接口地址
                type: 'POST',
                data: requestData,
                success: function (response) {
                    // 请求成功时的处理
                    layer.msg(response);
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                },
                error: function (error) {
                    // 请求失败时的处理
                    console.error('失败:', error);
                }
            });
        })
        $('#backBtn').on('click',function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
            console.log('back');
        })
    });
</script>
</body>
</html>
