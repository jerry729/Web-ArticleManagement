
function checkTypeName() {
    var name = $("#name").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checku").html("名称不能为空且长度在1～12位之间！");
        $("input[id=name]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "addType.do",
            type : "post",
            data : "name=" + name,
            dataType : "json",
            success:function(result){
                if(result.info=="ok"){
                    $("#checku").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checku").html("添加成功！");
                    return true;
                }
            },
            error:function(){
                alert("请求处理中！");
                return false;
            }

        });
    }

}



/*更新分类*/
function updateTypeName() {
    var name = $("#name").val();
    var tid = $("#tid").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checku").html("名称不能为空且长度在1～12位之间！");
        $("input[id=name]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "updateFtype.do",
            type : "post",
            data : {"name":name,"id":tid},
            dataType : "json",
            success:function(result){
                if(result.info=="ok"){
                    $("#checku").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checku").html("更新成功！");
                    return true;
                }
            },
            error:function(){
                alert("请求处理中！");
                return false;
            }

        });
    }

}


/**
 * ==新闻分类-
 * */

function checkTypeName_news() {
    var name = $("#name").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checku").html("名称不能为空且长度在1～12位之间！");
        $("input[id=name]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "addType_news.do",
            type : "post",
            data : "name=" + name,
            dataType : "json",
            success:function(result){
                if(result.info=="ok"){
                    $("#checku").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checku").html("添加成功！");
                    return true;
                }
            },
            error:function(){
                alert("请求处理中！");
                return false;
            }

        });
    }

}



/*更新分类*/
function updateTypeName_news() {
    var name = $("#name").val();
    var tid = $("#tid").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checku").html("名称不能为空且长度在1～12位之间！");
        $("input[id=name]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "updateFtype_news.do",
            type : "post",
            data : {"name":name,"id":tid},
            dataType : "json",
            success:function(result){
                if(result.info=="ok"){
                    $("#checku").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checku").html("更新成功！");
                    return true;
                }
            },
            error:function(){
                alert("请求处理中！");
                return false;
            }

        });
    }

}