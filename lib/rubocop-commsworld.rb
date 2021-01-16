# frozen_string_literal: true

require "rubocop"

require_relative "rubocop/commsworld"
require_relative "rubocop/commsworld/version"
require_relative "rubocop/commsworld/inject"

RuboCop::Commsworld::Inject.defaults!
# TODO: Add a setting which allows using the cops in this gem without loading the house style.
RuboCop::Commsworld::Inject.house_style!

require_relative "rubocop/cop/commsworld_cops"
