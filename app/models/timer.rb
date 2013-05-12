class Timer
  include Mongoid::Document
  field :header, type: String
  field :year, type: Integer
  field :month, type: Integer
  field :day, type: Integer
  field :wday, type: Integer
  field :hour, type: Integer
  field :minute, type: Integer
  field :timezone, type: String

  embedded_in :event
  embedded_in :notification
end
