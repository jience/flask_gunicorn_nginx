# Docker + Gunicorn + Nginx 部署 Flask 应用

![Gunicorn-Flask](./static/images/gunicorn_flask.jpg)

## Q&A

1. 自定义容器启动脚本报错: standard_init_linux.go:178: exec user process caused "no such file or directory"

> 原因是镜像的entrypoint设置的启动脚本格式是dos，在linux系统上用vi修改成unix格式即可

```
vi filename
:set ff  # 回车后看到当前文件的fileformat格式
:set ff=unix # 回车后输入:wq保存文件，重新build镜像即可
```


2. docker运行nginx为什么要使用 daemon off

> Docker 容器启动时，默认会把容器内部第一个进程，也就是pid=1的程序，作为docker容器是否正在运行的依据，如果 docker 容器pid=1的进程挂了，那么docker容器便会直接退出。
