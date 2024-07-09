# encoding: utf-8
require "logstash/filters/base"

# This combine filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an combine.

class LogStash::Filters::Combine < LogStash::Filters::Base

  # filter {
  #   combine {
  #     target => "targetfield"
  #     sources => ["sourcefield1","sourcefield2"]
  #   }
  # }
  #
  config_name "combine"

  #Replace the message with this value.
  #config :message, :validate => :string, :default => "Hello World!"

  config :sources, :validate => :array
  config :target, :validate => :string
  config :remove_sources, :validate => :boolean, :default => false
  config :keep_target, :validate => :boolean, :default => false

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    arr = event.get(@target) if @keep_target
    arr = [] if arr.nil?

    @sources.each do |field|
      data = event.get(field)
      if !data.nil?
       arr << data
       event.remove(field) if @remove_sources
      end
    end

    if arr.length() > 0
      event.set(@target, arr)
      filter_matched(event)
    end

  end # def filter
end # class LogStash::Filters::Combine
