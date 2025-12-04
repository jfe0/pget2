@echo off

set "script_path=%~dp0"
echo %script_path%
echo %date% %time%
@REM ::使用dos变量时不能带引号，但是其它参数的值字符串必须带引号。因为dos的传参方式问题导致。参数中注意管道符，只有双引号内管道符不生效
::runhiddenconsole.exe ^ 
@REM ::文件模式
php.exe C:\workspace\crawler\pget2.php --directory-prefix=%script_path% --recursive --no-verbose --no-clobber --adjust-extension --no-check-certificate --output-file="php://null" --save-cookies="cookie" --user-agent="Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)" --reject-regex="\?|#|&|\.(?:rar|gz|zip|epub|txt|pdf|apk|deb|dmg|exe)$" --tries=1000 --max-threads=9 --wait=1 --sub-string="<p class=\"body\">|</p>" https://www.a.com/
@REM ::数据库模式
::php.exe C:\workspace\crawler\pget2.php --directory-prefix=%script_path% --store-database --no-echo --page-requisites --recursive --no-verbose --no-check-certificate --user-agent="Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)" --reject-regex="\?|#|&|\.(?:rar|gz|zip|epub|txt|pdf|apk|deb|dmg|exe)$" --tries=6 --max-threads=2 --wait=1 --pause-time=200 --pause-period=30 --strip-ss --strip-blank --sub-string="<div class=\"container mt-md-2\">|<footer>" --delete-string="<div class=\"d-none\">|<footer>" --span-hosts --domains="www.a.com" https://www.a.com/
