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
    <title>农产品销售</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
</div>

<div class="product-table">
    <table id="custProductTable" lay-filter="test" class="display" style="width:100%"></table>
</div>

<!-- 商品表格操作列的模板 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="details">查看详情</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="addCart">加入购物车</a>
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
            elem: '#custProductTable',
            url: '<%=path%>/getAllProducts.do',
            method: 'get',
            page: true,
            limits: [5,10,15,20],
            limit: 5,
            id: 'custProductTable',
            layFilter: 'test',
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            cols: [[
                {field: 'productName', title: '商品名称', width: '10%',sort: true},
                {field: 'productPrice', title: '价格(元/斤)', width: '10%',sort: true},
                {field: 'productStock', title: '库存(斤)', width: '10%',sort: true},
                {field: 'productImageUrl', title: '图片', width: '10%',templet: function (d) {
                        return '<img class="product-image" width=30px height=30px src="<%=imgPath%>/'+d.productImageUrl+'" alt="Product Image">';
                    }},
                {field: 'productOrigin', title: '原产地', width: '10%'},
                {field: 'productDescription', title: '描述', width: '10%'},
                {field: 'productProductionDate', title: '上架日期', width: '20%',sort: true},
                {field: 'operation', title: '操作', width: '20%', toolbar: '#barDemo'}
            ]],
            done: function (res, curr, count) {
                // 表格渲染完成后执行事件绑定
                table_product.on('tool(test)', function (obj) {
                    var data = obj.data; // 获取当前行数据
                    var layEvent = obj.event; // 获取 lay-event 对应的值
                    if (layEvent === 'details') {
                        // 执行查看详情操作
                        console.log('查看详情');
                        layer.open({
                            type: 2,//iframe
                            title: '商品详情',
                            area: ['600px','600px'],
                            closeBtn: 2,
                            content: '<%=path%>/product/toDetails.do?productId='+data.productId,
                        });

                    } else if (layEvent === 'addCart') {
                        // 执行加入购物车操作
                        var productId = data.productId;
                        //取出用户信息
                        var storedUserInfo = sessionStorage.getItem('userInfo');
                        var userInfoObject = JSON.parse(storedUserInfo);
                        //获得用户id
                        var userId = userInfoObject.userId;
                        // console.log(productId);
                        // console.log(userId);
                        $.ajax({
                            url: '<%=path%>/cart/add.do?productId='+productId+'&userId='+userId,
                            type: 'Get',
                            success: function (response) {
                                layer.msg(response);
                                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                parent.layer.close(index); //再执行关闭
                            },
                            error: function (error) {
                                console.error('失败：', error);
                            }
                        });
                        console.log('加入购物车');
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
                table_product.reload('custProductTable', {
                    url: '<%=path%>/getAllProducts.do'
                });
            }else{
                table_product.reload('custProductTable', {
                    url: '<%=path%>/getProductsByCategoryId.do',
                    where: {
                        categoryId: currentCategoryId
                    }
                });
            }
        });

        // 搜索按钮点击事件
        $('#btn-search').on('click', function () {
            //获取关键字
            var keyword = $('#searchInput').val();
            console.log(keyword)
            // 更新 Layui 数据表格的 URL
            table_product.reload('custProductTable', {
                url: '<%=path%>/getProductsByName.do',
                where: {
                    productName: keyword
                }
            });
        });
    });
</script>

</body>
</html>
