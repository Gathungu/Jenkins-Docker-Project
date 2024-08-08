FROM centos:latest
MAINTAINER collins.gathungu@gmail.com

# Install httpd and utilities
RUN yum install -y httpd zip unzip curl && \
    yum clean all && \
    rm -rf /var/cache/yum

# Download and extract template
RUN curl -o /var/www/html/2137_barista_cafe.zip https://www.tooplate.com/zip-templates/2137_barista_cafe.zip && \
    cd /var/www/html && \
    unzip 2137_barista_cafe.zip && \
    cp -rvf 2137_barista_cafe/* . && \
    rm -rf 2137_barista_cafe 2137_barista_cafe.zip

# Set the working directory
WORKDIR /var/www/html/

# Expose port 80
EXPOSE 80

# Start httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]




#FROM  centos:latest
#MAINTAINER collins.gathungu@gmail.com
#RUN yum install -y httpd \
# zip\
# unzip
#ADD https://www.tooplate.com/zip-templates/2137_barista_cafe.zip /var/www/html/
#WORKDIR /var/www/html/
#RUN unzip 2137_barista_cafe.zip
#RUN cp -rvf 2137_barista_cafe/* .
#RUN rm -rf 2137_barista_cafe 2137_barista_cafe.zip
#CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#EXPOSE 80
 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
