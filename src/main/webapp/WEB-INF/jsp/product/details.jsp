<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/23
  Time: 21:32
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
    <title>商品详情</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input hidden id="productId" type="text" name="productId" readonly  lay-verify="readonly" value="${product.productId}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input id="productName" type="text" name="productName" readonly  lay-verify="readonly" value="${product.productName}" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <input id="categoryName" type="text" name="categoryName" readonly  lay-verify="readonly" value="${categoryName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input id="productPrice" type="text" name="productPrice" readonly  lay-verify="readonly" value="${product.productPrice}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">库存</label>
        <div class="layui-input-block">
            <input id="productStock" type="text" name="productStock" readonly  lay-verify="readonly" value="${product.productStock}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">原产地</label>
        <div class="layui-input-block">
            <input id="productOrigin" type="text" name="productOrigin" readonly  lay-verify="readonly" value="${product.productOrigin}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上架日期</label>
        <div class="layui-input-block">
            <input id="productProductionDate" type="text" name="productProductionDate" lay-verify="readonly" value="${product.productProductionDate}" autocomplete="off" class="layui-input" readonly>
        </div>
    </div>

    <div class="layui-form-item">
        <img src="<%=imgPath%>/img/${product.productImageUrl}" height="50px" width="50px" alt="img"/>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-block">
            <textarea id="productDescription" name="productDescription" value="${product.productDescription}" class="layui-textarea">${product.productDescription}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addCartBtn" type="button" class="layui-btn" >加入购物车</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>
    console.log(${product.productProductionDate})
    //Demo
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var product
        $('#addCartBtn').on('click',function () {
            console.log('adCart');
        })
        $('#backBtn').on('click',function () {
            console.log('adCart');
        })
    });
</script>
</body>
</html>
