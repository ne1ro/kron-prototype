class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :description, type: String
  field :rating, type: Integer
  field :hour, type: Integer
  field :minute, type: Integer
  field :month, type: Integer
  field :day, type: Integer
  field :year, type: Integer
  field :time, type: Time

  embeds_many :notifications
end
