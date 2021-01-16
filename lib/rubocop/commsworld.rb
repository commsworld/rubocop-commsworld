require "rubocop/commsworld/version"

module RuboCop
  module Commsworld
    class Error < StandardError; end
    PROJECT_ROOT = Pathname.new(__dir__).parent.parent.expand_path.freeze

    private_constant(:PROJECT_ROOT)
  end
end
