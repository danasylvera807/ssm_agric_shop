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
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>

    <style>
        .order-container {
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
<div class="order-container">
    <ul id="navbar" class="layui-nav" lay-filter="horizontalNav">
        <c:forEach var="s" items="${states}">
            <li data-category-id="${s}" class="layui-nav-item">
                <a href="#">${s.getState()}</a>
            </li>
        </c:forEach>
    </ul>
    <div class="header-center">
        <div class="header-search">
            <input type="text" placeholder="输入订单号" id="searchInput">
            <button class="layui-btn layui-btn-sm" id="btn-search">搜索</button>
        </div>
    </div>
</div>

<div class="order-table">
    <table id="orderTable" lay-filter="test" class="display" style="width:100%"></table>
</div>

<!-- 订单表格操作列的模板 -->
<script type="text/html" id="barDemo">
    {{# if(d.orderState === 'PENDING_PAYMENT') { }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="details">查看详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="pay">支付</a>
    <a class="layui-btn layui-btn-xs" lay-event="cancel">取消订单</a>
    {{# } else if(d.orderState === 'DELIVERED') { }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="details">查看详情</a>
    <a class="layui-btn layui-btn-xs" lay-event="confirm">确认接收</a>
    {{# } else { }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="details">查看详情</a>
    {{# } }}
</script>



<script type="text/javascript">
    var storedUserInfo = sessionStorage.getItem('userInfo');
    var userInfoObject = JSON.parse(storedUserInfo);
    var userId = userInfoObject.userId;
    // 初始化 Layui
    layui.use(['table','layer'], function(){
        var table_order = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;
        var storedUserInfo = sessionStorage.getItem('userInfo');
        var userInfoObject = JSON.parse(storedUserInfo);

        var userId = userInfoObject.userId;
        var orderState = 'PENDING_PAYMENT';
        // 渲染表格
        table_order.render({
            elem: '#orderTable',
            url: '<%=path%>/order/listToCustomer.do?userId='+userId+'&orderState='+orderState,
            method: 'get',
            page: true,
            limits: [5,10,15,20],
            limit: 5,
            layFilter: 'test',
            request: {
                pageName: 'pageNum',
                limitName: 'pageSize'
            },
            cols: [[
                {field: 'orderNumber', title: '订单号', width: '10%'},
                {field: 'orderUser', title: '收货地址', width: '20%', templet: function(d){
                        return d.orderUser ? d.orderUser.userAddress : '';
                    }},
                {field: 'orderTime', title: '订单时间', width: '20%',sort: true},
                {field: 'orderTotalAmount', title: '总金额', width: '10%'},
                {field: 'shippingAddress', title: '发货地址', width: '20%'},
                {field: 'operation', title: '操作', width: '20%', toolbar: '#barDemo'}
            ]],
            done: function (res, curr, count) {
                // 表格渲染完成后执行事件绑定
                table_order.on('tool(test)', function (obj) {
                    var data = obj.data; // 获取当前行数据
                    var layEvent = obj.event; // 获取 lay-event 对应的值
                    if (layEvent === 'details') {
                        // 执行查看详情操作
                        layer.open({
                            type: 2,//iframe
                            title: '订单详情',
                            area: ['600px','600px'],
                            closeBtn: 2,
                            content: '<%=path%>/order/details.do?orderNumber='+data.orderNumber,
                            end: function(){
                                table_order.reload("orderTable");
                            }
                        });
                        console.log(data.orderNumber);

                    } else if (layEvent === 'pay') {
                        layer.confirm('确定支付订单吗？', function (index) {
                            var requestData = {
                                orderId: data.orderId,
                                orderState: orderState
                            };
                            $.ajax({
                                url: '<%=path%>/order/handle.do', // 替换成你的后端接口地址
                                type: 'POST',
                                data: requestData,
                                success: function (response) {
                                    // 请求成功时的处理
                                    if(response == 'success'){
                                        layer.msg('订单支付');
                                        table_order.reload("orderTable");
                                    }
                                },
                                error: function (error) {
                                    // 请求失败时的处理
                                    console.error('失败:', error);
                                }
                            });
                        });
                        console.log('支付');
                    } else if (layEvent === 'confirm') {
                        var requestData = {
                            orderId: data.orderId
                        };
                        $.ajax({
                            url: '<%=path%>/order/confirm.do', // 替换成你的后端接口地址
                            type: 'POST',
                            data: requestData,
                            success: function (response) {
                                // 请求成功时的处理
                                if(response == 'success'){
                                    layer.msg('订单已完成');
                                    table_order.reload("orderTable");
                                }
                            },
                            error: function (error) {
                                // 请求失败时的处理
                                console.error('失败:', error);
                            }

                        });
                    }else if (layEvent === 'cancel') {
                        layer.confirm('确定取消订单吗？', function (index) {
                            var requestData = {
                                orderId: data.orderId
                            };
                            $.ajax({
                                url: '<%=path%>/order/delete.do', // 替换成你的后端接口地址
                                type: 'POST',
                                data: requestData,
                                success: function (response) {
                                    // 请求成功时的处理
                                    if(response == 'success'){
                                        layer.msg('订单已取消');
                                        table_order.reload("orderTable");
                                    }
                                },
                                error: function (error) {
                                    // 请求失败时的处理
                                    console.error('失败:', error);
                                }
                            });
                        });
                        // console.log('取消订单')
                    }
                });
            }
        });
        // 监听导航栏点击事件
        $('#navbar li').on('click', function (event) {
            // 阻止默认链接行为
            event.preventDefault();
            // 获取选项的 categoryId
            orderState = $(this).data('category-id');
            var uid = userInfoObject.userId;
            table_order.reload('orderTable',{
                url: '<%=path%>/order/listToCustomer.do?userId=' + uid + '&orderState=' + $(this).data('category-id')
            });
        });

        // 搜索按钮点击事件
        $('#btn-search').on('click', function () {
            //获取关键字
            var orderNumber = $('#searchInput').val();
            if(orderNumber == ''){
                layer.msg('请输入订单号')
            }else{
                var requestData = {
                    orderNumber: orderNumber,
                    userId: userId
                };
                // 发送 POST 请求
                $.ajax({
                    url: '<%=path%>/order/searchForCustomer.do', // 替换成你的后端接口地址
                    type: 'POST',
                    data: requestData,
                    success: function (response) {
                        // 请求成功时的处理
                        if(response == 'no such order'){
                            layer.msg('不存在的订单')
                        }else if(response== 'success'){
                            layer.open({
                                type: 2,//iframe
                                title: '查看订单',
                                area: ['600px','600px'],
                                closeBtn: 2,
                                content: '<%=path%>/order/details.do?orderNumber='+orderNumber,
                                end: function(){
                                    table_order.reload("orderTable");
                                }
                            });
                        }
                    },
                    error: function (error) {
                        // 请求失败时的处理
                        console.error('失败:', error);
                    }
                });
            }
        });
    });
</script>

</body>
</html>
