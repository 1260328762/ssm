$(function () {

        $("#login").on("click",function () {
        var username = $("#un").val();
        var password = $("#pw").val();
        if(username==null || username==""){
            alert("用户名不能为空");
            return;
        }
        if(password==null || password==""){
            alert("密码不能为空");
            return;
        }
        var ctx = $("#PageContext").val();
        $.ajax({
           url : ctx+"/user/login.do",
           data : {"username":username,"password":password},
           type : "post",
           dataType : "text",
           success : function (res) {
               if(res=="0"){
                   alert("用户名或密码错误")
               }else{
                   window.location.href=ctx+"/user/toindex";
               }
           },
           error : function () {
               alert("连接服务器失败")
           }
        })
    })

})