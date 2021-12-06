
const menu = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "index2.jsp",
    "hidden": false,
    "list": []
}, {
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "loginOut.do",
    "list": []
}, {
    "name": "用户管理",
    "icon": "&#xe612;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "用户列表",
        "url": "userList.do"
    }, {
        "name": "个人信息管理",
        "url": "showUserInfo.do"
    },
        {
            "name": "修改密码",
            "url": "doUpdatePwd.do"
        }]
},{
    "name": "文章管理",
    "icon": "&#xe857;",
    "url": "",
    "hidden": false,
    "list": [ {
        "name": "文章管理",
        "url": "bookList.do"
    },{
        "name": "文章统计",
        "url": "bookList_tj.do"
    }]
}];

const config = {
    name: "管理员",
    menu: menu,
};

// module.exports.name = "Qadmin";
// module.exports.menu = menu;
