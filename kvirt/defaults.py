NETS = ['default']
POOL = 'default'
NUMCPUS = 2
MEMORY = 512
DISKINTERFACE = 'virtio'
DISKTHIN = True
DISKSIZE = 10
DISKS = [{'size': DISKSIZE}]
GUESTID = 'guestrhel764'
VNC = False
CLOUDINIT = True
RESERVEIP = False
START = True
EMULATOR = '/usr/bin/qemu-kvm'
TEMPLATES = {'cirros': 'http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img', 'centos': 'http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2', 'ubuntu': 'http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img', 'fedora': 'https://download.fedoraproject.org/pub/fedora/linux/releases/24/CloudImages/x86_64/images/Fedora-Cloud-Base-24-1.2.x86_64.qcow2', 'debian': 'http://cdimage.debian.org/cdimage/openstack/current/debian-8.6.0-openstack-amd64.qcow2'}
