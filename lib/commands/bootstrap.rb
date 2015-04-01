require 'packer-config'
require 'buildar/builders/factories/vmware'
require 'buildar/resources/ssh_key'

class BuildarCLI < Thor

  desc 'bootstrap', 'Configure and build the bootstrap image'
  def bootstrap
    ssh_key = Buildar::Resources::SshKey.new('build')
    ssh_key.generate

    config = Packer::Config.new 'coreos-bootstrap-vmware.json'
    output_directory = 'images/base'
    FileUtils.remove_dir(output_directory, true)

    builder = Buildar::Builders::Factories::VMWare.new.builder
    builder.output_directory output_directory
    builder.vm_name 'buildar-coreos-base-vmware'
    config.builders.push(builder)

    file_provisioner = Packer::Provisioner::File.new
    ssh_key_dest_path = '/tmp/build_ssh_key'
    file_provisioner.source ssh_key.public_key_path
    file_provisioner.destination ssh_key_dest_path
    config.provisioners.push(file_provisioner)

    shell_provisioner = Packer::Provisioner::Shell.new
    shell_provisioner.inline [
        'update-ssh-keys -u core -d coreos-cloudinit',
        "cat #{ssh_key_dest_path} | update-ssh-keys -u core -a buildar"
      ]
    config.provisioners.push(shell_provisioner)

    config.validate
    config.build
  end
end
