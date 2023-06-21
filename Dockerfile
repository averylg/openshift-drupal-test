


FROM registry.access.redhat.com/ubi9/php-81@sha256:f3486e8b190dcfd05fe3c55055188fa5d867c7b0a48081b2b430470e77b2d8ca

USER root
LABEL maintainer="ARCS StuWeb05"
# Update image
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y && rm -rf /var/cache/yum
# Add default Web page and expose port
RUN echo "The Web Server is Running" > /var/www/html/index.html
EXPOSE 80
# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]