<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/19
  Time: 19:12
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
    <title>购物车</title>
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
    <div class="header-center">
        <div class="header-search">
            <h2>购物车列表</h2>
        </div>
    </div>
    <button id="refreshBtn" class="layui-btn">刷新</button>
</div>

<div class="product-table">
    <table id="cartTable" lay-filter="cart_filter" class="display" style="width:100%"></table>
</div>

<!-- 商品表格操作列的模板 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="updateCart">修改数量</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteCart">删除</a>
</script>

<script type="text/javascript">
    var storedUserInfo = sessionStorage.getItem('userInfo');
    var userInfoObject = JSON.parse(storedUserInfo);
    console.log(JSON.stringify(userInfoObject));
    console.log('userId:'+userInfoObject.userId);
    // 初始化 Layui
    layui.use(['table','layer'], function(){
        var table_cart = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;

        // 渲染表格
        table_cart.render({
            elem: '#cartTable',
            url: '<%=path%>/cart/list.do?userId='+userInfoObject.userId,
            method: 'get',
            page: true,
            limits: [5,10,15,20],
            limit: 5,
            id: 'cartTable',
            layFilter: 'cart_filter',
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            cols: [[
                {field: 'cartProduct', title: '商品名称', width: '20%', sort: true, templet: function(d){
                        return d.cartProduct ? d.cartProduct.productName : '';
                    }},
                {field: 'cartProduct', title: '价格(元/斤)', width: '10%', sort: true, templet: function(d){
                        return d.cartProduct ? d.cartProduct.productPrice : '';
                    }},
                {field: 'cartProduct', title: '库存(斤)', width: '10%', sort: true, templet: function(d){
                        return d.cartProduct ? d.cartProduct.productStock : '';
                    }},
                {field: 'cartTime', title: '加入时间', width: '20%',sort: true},
                {field: 'quantity', title: '数量', width: '10%',sort: true},
                {field: 'operation', title: '操作', width: '30%', toolbar: '#barDemo'}
            ]],
            done: function (res, curr, count) {
                // 表格渲染完成后执行事件绑定
                table_cart.on('tool(cart_filter)', function (obj) {
                    var data = obj.data; // 获取当前行数据
                    var layEvent = obj.event; // 获取 lay-event 对应的值
                    if (layEvent === 'updateCart') {
                        // 执行查看详情操作
                        layer.open({
                            type: 2,//iframe
                            title: '更新农产品',
                            area: ['600px','600px'],
                            closeBtn: 2,
                            content: '<%=path%>/cart/toUpdate.do?cartId='+data.cartId,
                            end: function(){
                                table_cart.reload("cartTable");
                            }
                        });
                        console.log('修改数量');

                    } else if (layEvent === 'deleteCart') {
                        // 执行加入购物车操作
                        layer.confirm('确定删除该条数据吗？', function (index) {
                            // 发送删除请求
                            $.ajax({
                                url: '<%=path%>/cart/delete.do', // 后端处理删除请求的接口
                                type: 'GET',
                                data: {cartId: data.cartId},
                                success: function(result){
                                    table_cart.reload('cartTable');
                                    console.log(result);
                                },
                                error: function(){
                                    console.error('请求错误');
                                }
                            });
                            layer.close(index);
                        });
                    }
                });
            }
        });

        $('#refreshBtn').on('click', function () {
            table_cart.reload("cartTable");
        });
    });
</script>

</body>
</html>
