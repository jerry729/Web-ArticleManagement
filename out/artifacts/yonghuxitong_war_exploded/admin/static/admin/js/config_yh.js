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
    "name": "个人信息中心",
    "icon": "&#xe612;",
    "url": "",
    "hidden": false,
    "list": [ {
        "name": "个人信息管理",
        "url": "showUserInfo.do"
    },
        {
            "name": "修改密码",
            "url": "doUpdatePwd.do"
        }]
}, {
    "name": "文章管理",
    "icon": "&#xe857;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "文章管理",
        "url": "bookList.do"
    }]
}];

const config = {
    name: "用户",
    menu: menu,
};

// module.exports.name = "Qadmin";
// module.exports.menu = menu;
