require "restfolia"
require "restfolia/expansion_support"
require 'uri_template'

module Restfolia
  class EntryPoint
    include Restfolia::ExpansionSupport
  end
end