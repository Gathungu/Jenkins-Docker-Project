# Use an appropriate base image
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="collins.gathungu@gmail.com"

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        wget \
        unzip

# Download the zip file
RUN wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip -O /var/www/html/2137_barista_cafe.zip

# Set the working directory
WORKDIR /var/www/html/

# Unzip the file
RUN unzip 2137_barista_cafe.zip

# Copy the content of the unzipped directory to the root of the web server
RUN cp -rvf 2137_barista_cafe/* . && \
    rm -rf 2137_barista_cafe

# Clean up the zip file
RUN rm 2137_barista_cafe.zip

# Expose port 80
EXPOSE 80

# Command to run the Apache server in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]




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
