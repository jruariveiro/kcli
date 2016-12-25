VERSION="10"
ssh-keygen -N '' -t rsa -f /home/stack/.ssh/id_rsa
yum clean all
screen openstack undercloud install
mkdir images
#mkdir -p templates/environments
#cd templates/environments
#wget https://raw.githubusercontent.com/karmab/kcli/master/plans/openstack/tripleo/environments/password.yaml
#wget https://raw.githubusercontent.com/karmab/kcli/master/plans/openstack/tripleo/environments/_password.yaml
#wget https://raw.githubusercontent.com/karmab/kcli/master/plans/openstack/tripleo/environments/password.sh
wget https://raw.githubusercontent.com/karmab/kcli/master/plans/openstack/tripleo/templates.tar.gz
tar zxvf templates.tar.gz
cd ~/images
for i in /usr/share/rhosp-director-images/overcloud-full-latest-$VERSION.0.tar /usr/share/rhosp-director-images/ironic-python-agent-latest-$VERSION.0.tar; do tar -xvf $i; done
source ~/stackrc
openstack overcloud image upload --image-path /home/stack/images
neutron subnet-update `neutron subnet-list -c id -f value` --dns-nameserver 8.8.8.8
ssh-keyscan -H 192.168.101.1 >> ~/.ssh/known_hosts
cd
sh instackenv.sh
#tr '\n' '@' < .ssh/id_rsa  > prout
#sed -i "s/@/\\\\n/g" prout
openstack baremetal import --json ~/instackenv.json
sleep 3
openstack baremetal configure boot
openstack baremetal introspection bulk start
sh assignprofiles.sh
#openstack overcloud deploy --templates

# ISSUES FOUND
# you will need http://mirror.centos.org/centos/7/cloud/x86_64/openstack-mitaka/common/ipxe-roms-qemu-20160127-1.git6366fa7a.el7.noarch.rpm if using a centos hypervisor
# on newton, i had to make some adjustements:
# set interface_driver to neutron.agent.linux.interface.OVSInterfaceDriver on metadata__agent.ini  for service to start