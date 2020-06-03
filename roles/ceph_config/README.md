ssh root@ceph05 

ansible-playbook -i hosts ./main.yaml -vvvv

cd /usr/share/ceph-ansible/
ansible-playbook -i hosts site.yml -e @vars.yaml



ansible-playbook -i hosts site.yml -e @vars.yaml --limit rgsw
