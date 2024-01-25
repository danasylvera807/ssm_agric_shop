<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/21
  Time: 9:23
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
    <title>添加农产品</title>
    <<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>

</head>
<body>

<div class="layui-container" style="margin-top: 20px;">
    <form class="layui-form" method="post" action="<%=path%>/product/add.do" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
                <input id="productName" type="text" name="productName" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">分类</label>
            <div class="layui-input-block">
                <select id="categoryId" name="categoryId" lay-verify="required">
                    <c:forEach items="${categoryList}" var="c">
                        <option value="${c.categoryId}">${c.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">价格</label>
            <div class="layui-input-block">
                <input id="productPrice" type="text" name="productPrice" required  lay-verify="required" placeholder="请输入价格(元/斤)" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <input id="productStock" type="text" name="productStock" required  lay-verify="required" placeholder="请输入库存(斤)" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">原产地</label>
            <div class="layui-input-block">
                <input id="productOrigin" type="text" name="productOrigin" required  lay-verify="required" placeholder="请输入原产地" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上传图片</label>
            <div class="layui-input-block">
                <input id="file" type="file" name="file" placeholder="选择图片文件" autocomplete="off">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-block">
                <textarea id="productDescription" name="productDescription" placeholder="请输入农产品简介" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="submitForm">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    //Demo
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery
        // 监听表单提交事件
        form.on('submit(submitForm)', function (data) {
            // 使用 FormData 处理包含文件的表单数据
            var formData = new FormData(data.form);
            // 使用 Ajax 提交表单数据
            $.ajax({
                url: data.form.action,
                type: data.form.method,
                data: formData,
                processData: false,
                contentType: false,
                success: function (result) {
                    // 后端返回的字符串用于弹出消息框中的提示信息
                    console.log(result);
                    layer.msg(result);
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index); //再执行关闭
                },
                error: function () {
                    layer.msg("请求错误");
                }
            });
            // 阻止表单的默认提交行为
            return false;
        });
    });
</script>
</body>
</html>
