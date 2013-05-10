class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :description, type: String
  field :rating, type: Integer
  field :time, type: Time, :default -> {DateTime.now}

  embeds_many :notifications
end
