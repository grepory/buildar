require 'mixlib/shellout'

module Buildar
  module Resources
    class SshKey
      class SshKeyGenerationError < StandardError; end

      KEY_DIRECTORY = 'keys/'

      attr_reader :private_key_path, :public_key_path, :id

      # @param [String] id A unique identifier for this SSH key
      def initialize(id)
        @id = id
        @private_key_path = File.join(KEY_DIRECTORY, key_filename)
        @public_key_path = File.join(KEY_DIRECTORY, "#{key_filename}.pub")
      end

      # @param [Hash] opt
      # @option opt [Boolean] force Overwrite an existing key. (false)
      def generate(force: false)
        unless File.directory?(KEY_DIRECTORY)
          Dir.mkdir(KEY_DIRECTORY, 0700)
        end

        unless File.exist?(private_key_path) && !force
          cmd = Mixlib::ShellOut.new("ssh-keygen -t rsa -b 2048 -f #{private_key_path} -P ''")
          cmd.run_command

          raise SshKeyGenerationError.new("Error: #{cmd.stderr}") unless cmd.exitstatus == 0
        end
      end

      # Generate an SSH key, overwriting the previous SSH key.
      def generate!
        generate(force: true)
      end

      def key_filename
        "#{id}_rsa_key"
      end
    end
  end
end
