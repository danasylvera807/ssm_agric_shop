<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/18
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String imgPath = "https://sk308465.oss-cn-hangzhou.aliyuncs.com/img";
%>
<html>
<head>
    <title>农产品管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>

    <style>
        .product-container {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #navbar {
            display: flex;
            list-style: none;
        }

        #navbar li {
            margin-right: 10px;
        }

        #refreshBtn {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="product-container">
    <ul id="navbar" class="layui-nav" lay-filter="horizontalNav">
        <li data-category-id="0" class="layui-nav-item">
            <a href="#">全部</a>
        </li>
        <c:forEach var="c" items="${categoryList}">
            <li data-category-id="${c.categoryId}" class="layui-nav-item">
                <a href="#">${c.categoryName}</a>
            </li>
        </c:forEach>
    </ul>
    <div class="header-center">
        <div class="header-search">
            <input type="text" placeholder="输入农产品名称" id="searchInput">
            <button class="layui-btn layui-btn-sm" id="btn-search">搜索</button>
        </div>
    </div>
    <button id="addProduct" class="layui-btn">添加农产品</button>
    <button id="refreshBtn" class="layui-btn">刷新</button>
</div>

<div class="product-table">
    <table id="productTable" lay-filter="product_filter" class="display" style="width:100%"></table>
</div>

<!-- 商品表格操作列的模板 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>

<script type="text/javascript">
        // 初始化 Layui
        layui.use(['table','layer'], function(){
            var table_product = layui.table;
            var $ = layui.jquery;
            var layer = layui.layer;
            // 全局变量，用于存储当前的 categoryId
            var currentCategoryId = ${categoryList.get(0).categoryId};
            // 渲染表格
            table_product.render({
                elem: '#productTable',
                url: '<%=path%>/getAllProducts.do',
                method: 'get',
                page: true,
                limits: [5,10,15,20],
                limit: 5,
                id: 'productTable',
                layFilter: 'product_filter',
                request: {
                    pageName: 'pageNum',
                    limitName: 'pageSize'
                },
                cols: [[
                    {field: 'productName', title: '商品名称', width: '10%',sort: true},
                    {field: 'productPrice', title: '价格(元/斤)', width: '10%',sort: true},
                    {field: 'productStock', title: '库存(斤)', width: '10%',sort: true},
                    {field: 'productImageUrl', title: '图片',width: '10%', templet: function (d) {
                            return '<img class="product-image" width=30px height=30px src="<%=imgPath%>/'+d.productImageUrl+'" alt="Product Image">';
                        }},
                    {field: 'productOrigin', title: '原产地', width: '10%'},
                    {field: 'productDescription', title: '描述', width: '10%'},
                    {field: 'productProductionDate', title: '上架日期', width: '20%',sort: true},
                    {field: 'operation', title: '操作', width: '20%', toolbar: '#barDemo'}
                ]],
                done: function (res, curr, count) {
                    // 表格渲染完成后执行事件绑定
                    table_product.on('tool(product_filter)', function (obj) {
                        var data = obj.data; // 获取当前行数据
                        var layEvent = obj.event; // 获取 lay-event 对应的值
                        if (layEvent === 'edit') {
                            // 执行编辑操作
                            layer.open({
                                type: 2,//iframe
                                title: '更新农产品',
                                area: ['600px','600px'],
                                closeBtn: 2,
                                content: '<%=path%>/product/toUpdate.do?productId='+data.productId,
                                end: function(){
                                    table_product.reload("productTable");
                                }
                            });

                        } else if (layEvent === 'delete') {
                            // 执行删除操作
                            layer.confirm('确定删除该条数据吗？', function (index) {
                                console.log('删除', data.productId);
                                // 发送删除请求
                                $.ajax({
                                    url: '<%=path%>/product/delete.do', // 后端处理删除请求的接口
                                    type: 'GET',
                                    data: {productId: data.productId},
                                    success: function(result){
                                        console.log(result);
                                        table_product().reload('productTable');
                                        layer.msg(result);
                                    },
                                    error: function(){
                                        layer.msg('删除失败：服务器异常');
                                    }
                                });
                                layer.close(index);
                            });
                        }
                    });
                }
            });
            // 监听导航栏点击事件
            $('#navbar li').on('click', function (event) {
                // 阻止默认链接行为
                event.preventDefault();
                // 获取选项的 categoryId
                currentCategoryId = $(this).data('category-id');
                if(currentCategoryId == '0'){
                    console.log("全部")
                    table_product.reload('productTable', {
                        url: '<%=path%>/getAllProducts.do'
                    });
                }else{
                    table_product.reload('productTable', {
                        url: '<%=path%>/getProductsByCategoryId.do',
                        where: {
                            categoryId: currentCategoryId
                        }
                    });
                }
                // 更新 Layui 数据表格的 URL

            });

            // 搜索按钮点击事件
            $('#btn-search').on('click', function () {
                //获取关键字
                var keyword = $('#searchInput').val();
                console.log(keyword)
                // 更新 Layui 数据表格的 URL
                table_product.reload('productTable', {
                    url: '<%=path%>/getProductsByName.do',
                    where: {
                        productName: keyword
                    }
                });
            });
            // 添加按钮点击事件
            $('#addProduct').on('click', function () {
                layer.open({
                    type: 2,//iframe
                    title: '添加农产品',
                    area: ['600px','600px'],
                    closeBtn: 2,
                    content: '<%=path%>/product/toAdd.do',
                    end: function(){
                        table_product.reload("productTable");
                    }
                });
            });
            $('#refreshBtn').on('click', function () {
                table_product.reload("productTable");
            });
        });

</script>

</body>
</html>
