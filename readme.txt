镜像构建
docker build -t 18817810841/python:3.7.5 .
运行容器
docker run -d  \
    -e PYPI_DOMAIN="http://pypi.example.com/repository/pypi-group/simple"  \
    -e PYPI_OPTION="--trusted-host pypi.example.com" \
    -v /data/python3.7.5:/data/python3.7.5 \
    -v /data/leisu:/data/leisu \
    -w /data/leisu/ \
    18817810841/python:3.7.5 sanic_start.py --app admin_api --env local


-w 工作目录 镜像会自动识别工作目录中的requirements.txt文件并安装
-v 挂载目录
PYPI_DOMAIN PYPI_OPTION pip镜像源配置
extrypoin 实际运行命令为python 具体运行业务后边添加运行参数：sanic_start.py --app admin_api --env local