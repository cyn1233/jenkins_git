#新生成的镜像是基于nginx:dockerfile镜像
FROM centos
MAINTAINER by thz
WORKDIR /opt/src

#安装wget
RUN yum install -y  wget
#下载并解压源码包
RUN wget http://nginx.org/download/nginx-1.8.0.tar.gz
RUN tar -zxvf nginx-1.8.0.tar.gz
WORKDIR nginx-1.8.0
#编译安装nginx
RUN yum install -y gcc make pcre-devel zlib-devel
RUN ./configure --prefix=/opt/nginx   --with-pcre
RUN make
RUN make install

#定义配置目录
ENV WORK_PATH /opt/nginx/conf
#定义conf文件名
ENV CONF_FILE_NAME nginx.conf
#删除原有配置文件
RUN rm $WORK_PATH/$CONF_FILE_NAME
#复制新的配置文件
ADD $CONF_FILE_NAME $WORK_PATH/

#启动Nginx服务
#RUN /opt/nginx/sbin/nginx
#修改Nginx配置文件,以非daemon方式启动
RUN echo "daemon off;">>/opt/nginx/conf/nginx.conf
#复制服务启动脚本并设置权限
RUN mkdir -p /opt/sbin
ADD ./run.sh /opt/sbin/
RUN chmod 755 /opt/sbin/run.sh
#设置生成容器时需要执行的脚本
CMD ["/opt/sbin/run.sh"]
#开放80端口
EXPOSE 80
