<%--
  Created by IntelliJ IDEA.
  User: 30846
  Date: 2024/1/25
  Time: 21:39
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="<%=path%>/static/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery-3.6.4.min.js"></script>>
</head>
<body>
<div class="layui-container" style="margin-top: 20px;">
    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-block">
            <input type="password" name="oldPwd" id="oldPwd" required  placeholder="请输入旧密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" name="newPwd1" id="newPwd1" required  placeholder="请输入新密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="password" name="newPwd2" id="newPwd2" required  placeholder="确认新密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="pwdUpdateBtn" type="button" class="layui-btn" >确定修改</button>
            <button id="backBtn" type="button" class="layui-btn layui-btn-primary">返回</button>
        </div>
    </div>
</div>

<script>
    //Demo
    layui.use(['layer','jquery'], function(){
        var layer = layui.layer;
        var $ = layui.jquery;

        $('#pwdUpdateBtn').on('click',function () {
            var storedUserInfo = sessionStorage.getItem('userInfo');
            var userInfoObject = JSON.parse(storedUserInfo);
            var userId = userInfoObject.userId;

            var newPwd1 = $('#newPwd1').val();
            var newPwd2 = $('#newPwd2').val();
            if((newPwd1 != newPwd2)){
                layer.msg('密码不一致');
            }else{
                $.ajax({
                    url: '<%=path%>/user/pwd.do',
                    type: 'post',
                    data: {
                        userId: userId,
                        userPwd: newPwd1
                    },
                    success: function (response) {
                        if(response == 'success'){
                            layer.msg('密码修改成功，请重新登录', {
                                time: 0, // 不自动关闭
                                btn: ['确定'],
                                yes: function(index, layero){
                                    sessionStorage.removeItem('userInfo');
                                    // 跳转主页
                                    parent.window.location.href = '<%=path%>/agricshop.do';
                                    // 关闭弹窗
                                    parent.layer.close(index); // 关闭弹窗
                                }
                            });
                        }else if(response == 'pwd mistake'){
                            layer.msg('密码输入错误');
                        }else{
                            layer.msg('服务器错误');
                        }
                    },
                    error: function (error) {
                        console.error('失败：', error);
                    }
                });



            }

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
