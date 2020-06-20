################################################
# These steps were taken for deploying the Java App
################################################

# Installing Java JDK
echo "##################################"
echo "INSTALLING JDK ...."
echo "##################################"
sudo apt-get install default-jdk

# Installing Apache Tomcat (Ensure you run this part as root)
echo "##################################"
echo "INSTALLING TOMCAT ...."
echo "##################################"
sudo bash
mkdir /opt/tomcat
cd opt/tomcat
wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz
tar xvzf apache-tomcat-8.5.56.tar.gz
cd apache-tomcat-8.5.56

echo 'export CATALINA_HOME=/opt/tomcat/apache-tomcat-8.5.56' >> ~/.bashrc
.~/.bashrc
echo "##################################"
echo "CATALINA HOME WAS SET SUCCESSFULLY!"
echo "##################################"

sed -i 's/8080/8888/g' /opt/tomcat/apache-tomcat-8.5.56/conf/server.xml
newline=$'\n'
echo '<role rolename="manager-script" /> ${newline}<user username="admin" password="admin" roles="manager-gui, admin-gui, manager-script"/>' >> /opt/tomcat/apache-tomcat-8.5.56/conf/tomcat-users.xml
echo "##################################"
echo "USERNAME AND PASSWORD SET TO: admin"
echo "##################################"

$CATALINA_HOME/bin/startup.sh

echo "##################################"
echo "OPEN TOMCAT IN BROWSER AT 127.0.0.1:8888"
echo "##################################"

#sensible-browser localhost:8888

echo "##################################"
echo "INSTALLING JENKINS ...."
echo "##################################"

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
apt-get install jenkins

echo "##################################"
echo "OPEN JENKINS IN BROWSER AT 127.0.0.1:8080"
echo "##################################"

#sensible-browser localhost:8080

echo "#############################################"
echo "NOW YOU CAN CONFIGURE JENKINS TO DEPLOY FROM GITHUB. BYEE!"
echo "#############################################"


