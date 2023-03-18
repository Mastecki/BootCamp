```
sudo echo "db ansible_host=10.0.0.11 ansible_private_key_file=/vagrant/.vagrant/machines/node1/virtualbox/private_key" > /etc/ansible/hosts
sudo echo "app ansible_host=10.0.0.12 ansible_private_key_file=/vagrant/.vagrant/machines/node2/virtualbox/private_key" >> /etc/ansible/hosts
ansible-galaxy install -r requirements.yml
ansible-playbook mealie.yml --extra-vars "@vars.yml" --ask-vault-password
password
```
http://10.0.0.12:9090/