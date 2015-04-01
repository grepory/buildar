require 'packer-config'

module Buildar
  module Builders
    module Factories
      class VMWare
        attr_reader :builder

        DEFAULT_SOURCE = File.join(ENV['HOME'], 'dev/coreos/coreos_production_vmware_insecure/coreos_production_vmware_insecure.vmx')
        DEFAULT_SSH_USER = 'core'

        # @param [String] source Source path to the VMWare VMX to use
        # @param [String] ssh_username SSH Username
        # @param [Hash] opts
        # @opt
        def initialize(opts = {})
          @builder = Packer::Builder.get_builder(Packer::Builder::VMWARE_VMX)

          opts[:source_path] ||= DEFAULT_SOURCE
          opts[:ssh_username] ||= DEFAULT_SSH_USER
          opts[:ssh_key_path] ||= File.join(ENV['HOME'], 'dev/coreos/coreos_production_vmware_insecure/insecure_ssh_key')
          opts[:shutdown_command] ||= 'sudo shutdown -P now'
          opts[:output_directory] ||= 'images'

          builder.source_path opts[:source_path]
          builder.ssh_username opts[:ssh_username]
          builder.headless true
          builder.ssh_key_path opts[:ssh_key_path]
          builder.shutdown_command opts[:shutdown_command]
          builder.output_directory opts[:output_directory]
        end
      end
    end
  end
end
