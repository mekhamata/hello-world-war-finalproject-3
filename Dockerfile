FROM maven as build 
WORKDIR /app
COPY . .
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package


FROM tomcat:9.0 
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT ["catalina.sh", "run"]

