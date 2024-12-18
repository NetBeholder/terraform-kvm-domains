ansible_playbook_name = "ansible-playbook.yml"

# single VM
vm = {
  name      = "test-vm"
  bridge    = "nm-br.16"
  cpu       = 1
  disk_size = 10 * 1024 * 1024 * 1024 #10Gb
  ram       = 2 * 1024 # 2Gb
  autostart = "false"
}
# arrays of VM
vms = [
  {
    name      = "test-vm-01"
    bridge    = "nm-br.16"
    cpu       = 1
    disk_size = 10 * 1024 * 1024 * 1024 #10Gb
    ram       = 2 * 1024 # 2Gb
    autostart = "false"
  },
  {
    name      = "test-vm-02"
    bridge    = "nm-br.16"
    cpu       = 1
    disk_size = 10 * 1024 * 1024 * 1024 #10Gb
    ram       = 2 * 1024 # 2Gb
    autostart = "false"
  }
]
