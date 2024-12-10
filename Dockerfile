FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/python:3.11.1

MAINTAINER yongqing.chen <yongqing1102@126.com>

WORKDIR /app

COPY ./requirements.txt .

# Set timezone
RUN yum install -y tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum clean all

# Install dependencies
RUN yum install -y gcc libxml2-devel libxslt-devel && \
    pip install --no-cache-dir -r requirements.txt && \
    yum remove -y gcc && \
    yum clean all

COPY . .

EXPOSE 5010

ENTRYPOINT [ "sh", "start.sh" ]