require 'buildar/version'

# Buildar
#
# This is the top level container module for your library.
module Buildar
  # Callback invoked before the CLI loads all its command modules.
  def self.before_command_load
  end

  # Callback invoked after the CLI loads all its command modules.
  def self.after_command_load
  end
end
