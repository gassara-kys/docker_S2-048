FROM tomcat:7.0-jre8

ADD struts-2.3.32/apps/struts2-showcase.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
