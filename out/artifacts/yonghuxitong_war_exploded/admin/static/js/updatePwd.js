

var checkSourcePwdc=false;
var checkPwdC=false;

function checkSourcePwd() {
    var name = $("#sPwd").val();
    var sourcePwd = $("#sourcePwd").val();
    if (name!=sourcePwd) {
        $("#checkSourcePwd").html("原密码不正确！请重新输入");
        $("input[id=sPwd]").focus();
    }else {
        $("#checkSourcePwd").html("原密码正确");
        checkSourcePwdc=true;
        return true;
    }
}

function checkPwd(){
    var pwd=$("#pwd").val();
    if(pwd==""||pwd.length<6||pwd.length>12){
        $("#checkPwd").html("密码不能为空且长度在6～12位之间！");
        $("input[id=pwd]").html("");
        $("input[id=pwd]").focus();
        return false;
    }else {
        $("#checkPwd").html("密码格式正确！");
        return true;}

}

function checkPwdc(){
    var pwd=$("#pwd").val();
    var pwdc=$("#pwdc").val();
    if(pwdc==""||pwdc!=pwd){
        $("#checkPwdc").html("两次密码要一致 ！");
       // $("input[id=pwdc]").focus();
        return false;
    }else{
        $("#checkPwdc").html("密码一致 ！");
        checkPwdC=true;
        return true;}
}


function checkPwdAll(){
    var flag=false;
    if(checkPwdC==true&&checkSourcePwdc==true){
        flag=true;
        return flag;
    }else{
        alert("修改密码信息不完整或不合规范！")
        $("#checkPwdc").html("修改密码信息不完整或不合规范！");
        return false;
    }
}



