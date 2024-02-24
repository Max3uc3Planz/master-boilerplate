FROM expert360/elasticmq:0.13.8
ADD custom.conf /elasticmq/custom.conf

CMD ["java", "-jar", "-Dconfig.file=/elasticmq/custom.conf", "/elasticmq/server.jar"]