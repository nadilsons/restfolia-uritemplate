require "restfolia"
require "restfolia-uritemplate/expansion_support"
require "restfolia-uritemplate/version"
require 'uri_template'

module Restfolia
  class EntryPoint
    include Restfolia::Uritemplate::ExpansionSupport
  end
end