# Install Filebeat


### Install Guide for Filebeat installation on DVWA container

- Open a terminal and SSH into your jump box:
  1. Start the Ansible container.
  2. SSH into the Ansible container.
  
- Copy the provided configuration file for Filebeat to your Ansible container:\
	`curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml`

- Edit the configuration in this file to match the settings described in the installation instructions for your server.
  1. Scroll to line #1106 and replace the IP address with the IP address of your ELK machine.
     `output.elasticsearch:`\
       `hosts: ["10.1.0.4:9200"]`\
       	`username: "elastic"`\
       	`password: "changeme"`
     
  2. Scroll to line #1806 and replace the IP address with the IP address of your ELK machine.\
     `setup.kibana:`\
     `host: "10.1.0.4:5601"`
     
     After you have edited the file, your settings should resemble the below. Your IP address may be different, but all other settings should be the same,
including ports.

- Copy the ***filebeat-playbook.yml*** to the location ***/etc/ansible***

- Run the playbook from its location: `ansible-playbook filebeat-playbook.yml`

- Next, you needed to confirm that the ELK stack was receiving logs. Navigate back to the Filebeat installation page on the ELK server GUI - http://104.43.133.239:5601/app/kibana#/home/tutorial/systemLogs.
  1. Verify that your playbook is completing Steps 1-4.
  2. On the same page, scroll to **Step 5: Module Status** and click **Check Data**.
  3. Scroll to the bottom and click on the button **System Logs Dashboard**.
  
  <br />

#### Dashboard for data captured by Filebeat

<br />

![Dashboard for data captured by Filebeat](https://github.com/chaitanyasugathan/Cybersecurity/blob/master/CloudSecurity/Screengrabs/Filebeat_Dashboard.JPG)

<br />
