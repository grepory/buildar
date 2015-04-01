require 'packer-config'
require 'buildar/resources/ssh_key'

class BuildarCLI < Thor
  desc 'build', 'Build it all'
  def build
    config = Packer::Config.new 'coreos-vmware.json'
    config.description 'builds a coreos image'

    builder = Buildar::Builders::Factories::VMWare.new(
      source_path: 'images/base/buildar-coreos-base-vmware.vmx',
      ssh_key_path: Buildar::Resources::SshKey.new('build').private_key_path
    ).builder

    output_directory = 'images/platform'
    FileUtils.remove_dir(output_directory, true)

    builder.output_directory 'images/platform'
    builder.vm_name 'buildar-coreos-platform-vmware.vmx'

    config.builders.push(builder)

    config.validate
    config.build
  end
end
