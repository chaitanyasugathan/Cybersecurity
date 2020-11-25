# Install Metricbeat

### Install Guide for Metricbeat installation on DVWA container

- Open a terminal and SSH into your jump box:
  1. Start the Ansible container.
  2. SSH into the Ansible container.
  
- Copy the provided configuration file for Metricbeat to your Ansible container:
  `curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-config.yml`
  
- Edit the configuration in this file to match the settings described in the installation instructions for your server.
  1. Scroll down to the below entry and replace the IP address with the IP address of your ELK machine \
     `setup.kibana:`\
        `host: "10.1.0.4:5601"`
  2. Next, scroll down to the below entry and replace the IP address with the IP address of your ELK machine \
     `output.elasticsearch:`\
         `hosts: ["10.1.0.4:9200"]`\
         `username: "elastic"`\
         `password: "changeme"`
     \
     Note: You can even copy the config file from this location.
     - [metricbeat-config.yml](Beats_Configs/metricbeat-config.yml)
- Copy the ***metricbeat-playbook.yml*** to the location ***/etc/ansible***

- Run the playbook from its location: `ansible-playbook metricbeat-playbook.yml`

- To verify that your play works as expected, Navigate back to the Metricbeat installation page on the ELK server GUI - http://104.43.133.239:5601/app/kibana#/home/tutorial/dockerMetrics.
  1. Verify that your playbook is completing Steps 1-4.
  2. On the same page, scroll to **Step 5: Module Status** and click **Check Data**.
  3. Scroll to the bottom and click on the button **System Logs Dashboard**.


<br />

#### Dashboard for data captured by Metricbeat

<br />

![Dashboard for data captured by Metricbeat](https://github.com/chaitanyasugathan/Cybersecurity/blob/master/CloudSecurity/Screengrabs/Metricbeat_Dashboard.JPG)

<br />
