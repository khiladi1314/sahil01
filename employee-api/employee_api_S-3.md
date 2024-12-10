# Setup Infra for Employee- Instances,Security Group,Listener Rules for Load Balancer


| Author | Created on | Version | Last updated by | Last edited on |
| :------: | :----------: | :-------: | :---------------: | :--------------: |
| Palash Kamble    | 25-05-24   | version 1 | Palash Kamble        | 25-05-24       |


## Table of Contents

| Sr.No | Heading |
|:-------:|---------|
| 1     | [Introduction](#introduction) |
| 2     | [Prerequisites](#prerequisites) |
| 3     | [Setup](#setup) |
| 4     | [Conclusion](#conclusion) |
| 5     | [Contact Information](#contact-information) |
| 6     | [Reference](#reference) |



## Introduction


Today we are going to create infrastructure for the employee-api API using, instances, load balancer, security group, and listener rules.

## Prerequisities

| Requirement            | Minimum                 
|:------------------------:|:--------------------------:|
| **AWS Account** | Administrative access / Role with appropriate permission |    


## Setup 

1. Launch Your Go lang -api . You can click on [link](https://github.com/OT-MyGurukulam/Snaatak_p8_Documentation/blob/main/OT-Microservices/Employee_API/Employee_doc.md) to check how to configure Golang api.

2. Create a service file of your api inside systemd **"/etc/systemd/system/"** .


<tab><tab><pre><code>nano /etc/systemd/system/employee.service</pre></code><br>

3. Add the content inside your service file.


<tab><tab><pre><code>/home/bhavin/Pictures/Screenshot from 2024-05-26 22-59-40.png
[Unit]
Description=Employee API Service
After=network.target

[Service]
User=ubuntu
Group=ubuntu
WorkingDirectory=/home/ubuntu/employee-api
ExecStart=/home/ubuntu/employee-api/employee-api
Restart=always
RestartSec=5
Environment=ENV_VAR_NAME=value  # Add your environment variables here
LimitNOFILE=65536

### Logging (optional, for better debugging)
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=employee-api

[Install]
WantedBy=multi-user.target</pre></code><br>


4. Run the commands:
<tab><tab><pre><code>sudo systemctl daemon-reexec
sudo systemctl enable employee.service
sudo systemctl start employee.service</pre></code><br>


5. Create Image of your instance in aws.

![Screenshot from 2024-05-26 23-06-51](https://github.com/MyGurukulam-P8/employee-api/assets/166389004/bc8917f6-ed2c-441b-a66c-4ce3962404cc)

6. Create launch template from this image

![Screenshot from 2024-05-26 23-21-03](https://github.com/MyGurukulam-P8/employee-api/assets/166389004/6c5b3b9f-4391-4b1f-ae29-3ad46239ce64)

7. Create a Target Group and do not attach any instance to it.

![Screenshot from 2024-05-26 23-23-33](https://github.com/MyGurukulam-P8/employee-api/assets/166389004/f3e7bfd5-1675-41bc-8deb-858b3d4aa749)

8.- Create Load Balancer and give listner Rule to "80" for http .Also use public subnet in its configuration.
  - Attach your target group with it.

![image](https://github.com/MyGurukulam-P8/employee-api/assets/166389004/89dbdfc5-cef9-4f99-bcdf-a1d46a54dcdc)

9. Once everything is done you can take your load balancer arn and hit on browser :-


<tab><tab><pre><code>trial-lb-1544432767.us-east-2.elb.amazonaws.com:80/api/v1/employee/health</pre></code><br>

![image](https://github.com/MyGurukulam-P8/employee-api/assets/166389004/7468fee3-78d2-41d6-bee1-a99b623e3d26)


## Conclusion
 In conclusion, the setup of infrastructure for the at employee API utilizing various AWS services like  instances, load balancer, security group, and listener rules has been successfully achieved. This infrastructure ensures scalability, availability, and security for the employee system. By following the outlined steps, a robust and reliable environment has been established to handle varying loads and maintain high performance. Moving forward, this setup can serve as a solid foundation for further development and expansion of the employee system.


## Contact Information
|Name	|Email address 📧|
| --------------- | -------------- |
|Palash Kamble|	palash.kamble@opstree.com|









## Reference



|Links	|Description|
| :---------------: | :--------------: |
| |
|[Link](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)| Service File
| [Link](https://github.com/opstree/OT-Microservices/tree/master/employee)| Employee_api Guide| 










