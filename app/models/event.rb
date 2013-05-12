class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :description, type: String
  field :rating, type: Integer

  embeds_many :notifications
  embeds_many :timers
end
