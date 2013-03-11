require "kolo/version"
require "kolo/icons"

module Kolo
  class Engine < ::Rails::Engine


  end
end


ActiveSupport.on_load(:action_view) do
  include Kolo::Icons
end
