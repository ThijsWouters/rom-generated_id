require "rom/generated_id/version"
require 'rom'

module ROM
  module GeneratedId
    def execute(tuple)
      super({id: SecureRandom.uuid}.merge(tuple))
    end
  end
end

ROM.plugins do
  register :generated_id, ROM::GeneratedId, type: :command
end

