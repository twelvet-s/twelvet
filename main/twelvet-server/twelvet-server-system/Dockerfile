# 指定基础镜像
FROM java:8
LABEL maintainer="2471835953@qq.com"
# 挂载到/tmp(集群共享,数据持久化)
VOLUME /tmp
# 将jar复制到容器的跟目录并且设置指定名称linux cp
ADD twelvet-server-system.jar twelvet-server-system.jar
# 端口号
EXPOSE 8081
# 启动容器时执行的命令
ENTRYPOINT ["java","-jar","/twelvet-server-system.jar"]
