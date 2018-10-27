#!/bin/bash

#安装依赖
cd dependencies
sudo ./install_dep.sh
cd ..

#生成 .desktop 文件
basepath=$(cd `dirname $0`; pwd)
cat>app.desktop<<EOF
[Desktop Entry]
Encoding=UTF-8
Name=app-gui
Exec=bash ${basepath}/run.sh
Icon=${basepath}/src/logo.jpg
Terminal=false
Type=Application
StartupNotify=true
EOF

chmod a+x app.AppImage
chmod a+x app.desktop

cp app.desktop ~/Desktop/app.desktop || cp app.desktop ~/桌面/app.desktop
