
# Full-Fledged DevOps Project: Amazon Clone (Website)

This is a DevOps project featuring an Amazon clone website that I integrated into a CI/CD pipeline. The pipeline automates the process where code is taken from the repository and built using Jenkins, a well-known automation tool. GitHub is integrated with Jenkins using a GitHub webhook and GitHub tokens as credentials for Jenkins. The final deployment occurs on an NGINX server hosted on an AWS EC2 instance.

## Project Overview

This simple DevOps project consists of the following:
1. EC2 Instance Setup: Creating and setting up an EC2 instance on AWS (Ubuntu in this case).
2. Jenkins Installation: Installing Jenkins and integrating it with GitHub via a webhook.
3. CI/CD Pipeline: Automating the build and deployment process using Jenkins and Docker.
4. Deployment: The website is deployed on an NGINX server.

## Prerequisites

- AWS account with an EC2 instance (Ubuntu recommended).
- GitHub account.
- Basic knowledge of Jenkins and Docker.

## Steps to Follow

### 1. Set Up Your EC2 Instance

- Create an EC2 instance in your AWS account (Ubuntu is used here).
- If you don't have an AWS account, you can follow tutorials on YouTube to set it up.
- Take the SSH session of your instance on your local machine.

### 2. Install Jenkins on the EC2 Instance

Since Jenkins is built on Java, the first step is to install Java on your virtual instance:

```bash
sudo apt update
sudo apt install openjdk-17-jdk
java -version
```

#### a) Install Jenkins:

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

Once Jenkins is installed, you should see its active status.

#### b) Jenkins Access:

Jenkins by default runs on port `8080`. You can access it using the public IP of your EC2 instance: `http://<your-ec2-public-ip>:8080`.

### 3. Fork the Amazon Clone Repository

Fork my [Amazon Clone Repository](https://github.com/Srijai1908/amazon_clone) into your GitHub account.

### 4. Integrate GitHub with Jenkins

- Go to the repository's **Settings** and configure the **GitHub Webhook**.
- Generate a **GitHub Token** and use it as the credential for Jenkins to authenticate GitHub after integration.

### 5. Configure Jenkins for the Project

- On Jenkins, go to `Manage Jenkins > Configure > Add Credentials`, and add the GitHub token you generated earlier.
- Create a new job and select "Freestyle project".

#### General Configuration:

- In **General**, select "GitHub Project" and paste the forked repository link.

#### Source Management:

- In **Source Code Management**, select "Git" and paste the repository link.
- Specify the branch (e.g., `main`).

#### Build Triggers:

- In **Build Triggers**, select "GitHub hook trigger for GITScm polling".

#### Build Steps:

- In **Build Steps**, add the following commands:

```bash
sudo docker ps --filter "publish=8000" -q | xargs -r docker rm -f
sudo docker build . -t myapp
sudo docker run -p 8000:80 -d myapp
```

### 6. Apply and Save

Click on **Apply** and **Save**.

### 7. Build the Project

Click on **Build** to start the process.

### 8. Access the Website

Once the build is complete, visit your EC2 instance's public IP, and you will see the hosted website.

## Conclusion

That's it! You've successfully set up and deployed the Amazon Clone website using Jenkins, GitHub, and Docker.

### Happy Learning! 🎉

Feel free to reach out if you need any help(srijai1908@gmail.com). 😊

