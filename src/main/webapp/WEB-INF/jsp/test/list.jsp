<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/21
  Time: 17:34
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
  <title>table</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.6.8/css/layui.css">
  <script src="https://cdn.staticfile.org/layui/2.6.8/layui.js"></script>
</head>
<body>
<div class="product-table">
  <table id="productTable" lay-filter="test" class="display" style="width:100%"></table>
  <button id="addProduct" type="button" class="layui-btn layui-btn-fluid">添加农产品</button>
</div>
<!-- 商品表格操作列的模板 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>

<script>
  layui.use('table', function(){
    var table = layui.table;
    console.log('layui=====')
// 监听工具条
    table.on('tool(test)', function(obj){
      var data = obj.data; // 获取当前行数据
      var layEvent = obj.event; // 获取 lay-event 对应的值
      console.log('caozuoni===')
      if(layEvent === 'edit'){ // 编辑
        // 执行编辑操作，可以跳转到编辑页面或弹出编辑框等
        console.log('编辑', data.id);
      } else if(layEvent === 'delete'){ // 删除
        layer.confirm('确定删除该条数据吗？', function(index){
          // 执行删除操作，可以发送删除请求等
          console.log('删除', data.id);

          // 关闭确认框
          layer.close(index);
        });
      }
    });
    // 渲染表格
    table.render({
      elem: '#productTable',
      url: '<%=path%>/getAllProducts.do',
      method: 'get',
      page: true,
      limits: [5,10,15,20],
      limit: 5,
      id: 'productTable',
      request: {
        pageName: 'pageNum',
        limitName: 'pageSize'
      },
      cols: [[
        {field: 'productName', title: '商品名称', width: 150,sort: true},
        {field: 'productPrice', title: '价格(元/斤)', width: 100,sort: true},
        {field: 'productStock', title: '库存(斤)', width: 100,sort: true},
        {field: 'productImageUrl', title: '图片', templet: function (d) {
            return '<img class="product-image" width=20px height=20px src="<%=imgPath%>/'+d.productImageUrl+'" alt="Product Image">';
          }},
        {field: 'productOrigin', title: '原产地', width: 100},
        {field: 'productDescription', title: '描述', width: 100},
        {field: 'productProductionDate', title: '生产日期', width: 100,sort: true},
        {field: 'operation', title: '操作', width: 150, toolbar: '#barDemo'}
      ]]
    });


  });

</script>
</body>
</html>
