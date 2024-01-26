<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/19
  Time: 19:13
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
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>
    <style>
        .product-container {
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            <h2>分类列表</h2>
        </div>
    </div>
    <span>
        <button id="AddBtn" class="layui-btn">新增分类</button>
        <button id="refreshBtn" class="layui-btn">刷新</button>
    </span>

</div>

<div class="product-table">
    <table id="categoryTable" lay-filter="category_filter" class="display" style="width:100%"></table>
</div>

<!-- 商品表格操作列的模板 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="updateCart">修改数量</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="deleteCart">删除</a>
</script>

<script type="text/javascript">
    // 初始化 Layui
    layui.use(['table','layer'], function(){
        var table_category = layui.table;
        var $ = layui.jquery;
        var layer = layui.layer;
        var tableLength;
        // 渲染表格
        table_category.render({
            elem: '#categoryTable',
            url: '<%=path%>/category/list.do',
            method: 'get',
            id: 'categoryTable',
            layFilter: 'category_filter',
            cols: [[
                {field: 'categoryId', title: '编号', width: '30%',sort: true},
                {field: 'categoryName', title: '数量', width: '30%',sort: true},
                {field: 'operation', title: '操作', width: '40%', toolbar: '#barDemo'}
            ]],
            done: function (res, curr, count) {
                tableLength=count;
                // 表格渲染完成后执行事件绑定
                table_category.on('tool(category_filter)', function (obj) {
                    var data = obj.data; // 获取当前行数据
                    var layEvent = obj.event; // 获取 lay-event 对应的值
                    if (layEvent === 'updateCart') {
                        // 执行查看详情操作
                        layer.open({
                            type: 2,//iframe
                            title: '修改分类',
                            area: ['400px','200px'],
                            closeBtn: 2,
                            content: '<%=path%>/category/toUpdate.do?categoryId='+data.categoryId,
                            end: function(){
                                table_category.reload("categoryTable");
                            }
                        });
                        console.log('修改数量');

                    } else if (layEvent === 'deleteCart') {
                        // 执行加入购物车操作
                        layer.confirm('删除分类会删除该分类的所有的产品，确定删除吗？', function (index) {
                            // 发送删除请求
                            $.ajax({
                                url: '<%=path%>/category/delete.do', // 后端处理删除请求的接口
                                type: 'GET',
                                data: {categoryId: data.categoryId},
                                success: function(result){
                                    layer.msg('已删除'+result+'条农产品记录');
                                    table_category.reload('categoryTable');
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
            table_category.reload("categoryTable");
        });
        $('#AddBtn').on('click', function () {
            layer.open({
                type: 2,//iframe
                title: '修改分类',
                area: ['400px','200px'],
                closeBtn: 2,
                content: '<%=path%>/category/toAdd.do',
                end: function(){
                    table_category.reload("categoryTable");
                }
            });
            console.log('新增分类');
        });

    });
</script>
</body>
</html>
