const {app, BrowserWindow} = require('electron')
//const node_app = require('./node/app') //启动node服务
const shell = require('child_process')

let win
function createWindow(){
    win = new BrowserWindow({
        width: 1280,
        height: 720,
        //frame: false,
        webPreferences: {
            webSecurity: false,
            nodeIntegration: false, //禁用node.js才能用html的方式引用其他模块
        },
    });
    win.loadURL("http://www.baidu.com")
    //win.maximize(); //最大化窗口

    //win.webContents.openDevTools()  //打开开发者模式
    win.on('closed', ()=>{
        win = null
    })
}

app.commandLine.appendSwitch("--disable-http-cache"); //禁用缓存
app.on('ready',async function(){
    createWindow()
})

app.on('window-all-closed', ()=>{
    if(process.platform !== 'darwin'){
        app.quit()
    }
})

app.on('activate', ()=>{
    if(win === null){
        createWindow()
    }
})

