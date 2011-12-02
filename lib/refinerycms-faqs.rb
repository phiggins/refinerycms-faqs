require 'refinerycms-core'

module Refinery
  module Faqs

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "faqs"
          plugin.url = '/refinery/faqs'
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/faq'
          }
        end
      end
    end
  end
end
