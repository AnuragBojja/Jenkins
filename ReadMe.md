# Jenkins File

### Plugins to install
- stage view
- pipeline utility steps (this plugin is required to use the readFile step)
- aws steps
- SonarQube scanner (restart jenkins after installing this plugin)
- AnsiColor


---
### Add the credentials to Jenkins 
Add the ssh username and password to Jenkins credentials. The username is the one used to connect to the server and the password is the private key.

---
### Add Node to Jenkins
- Go to Manage Jenkins -> Manage Nodes and Clouds -> New Node
use the name of the server as the node name and select "Permanent Agent". Then click OK.

---
### Create self hoster sonarQube server
    - user "SolveDevOps-SonarQube-Server-Ubuntu24.04-*" this ami to launch the instance
    - Configure the instance with the necessary security groups and key pairs
    - login with the private key and public ip (username: ubuntu)
    - ones logged in you will get instructions to know your username and password 
    - open sonarqube server on <public_ip>:9000. Login with your username and password.

---
### Use sonarQube in Jenkins
- install sonarqube tool in jenkins
- open manage jenkins->tools in jenkins and look for "SonarQube Scanner installations". Click "Add SonarQube Scanner" give name and select version and click save.
- open manage jenkins->system look for "SonarQube servers" open "SonarQube installations" add name and URL of the sonarqube server.Get the authentication token from the sonarqube server and use it in the installations.

install plugin for sonarqube -> restart jenkins  -> install sonarqube scanner in Tools -> add sonarqube server in System 

#### configure weebhook in sonarqube to receive notifications to Jenkins
- Go to the SonarQube project administration -> configurations -> Webhooks
- Navigate to "Webhooks"
- Click "Add Webhook"
- Enter the URL of the Jenkins server with /sonarqube-webhook/ at end.
example: http://<jenkins_url>:8080/sonarqube-webhook/
- Save the webhook