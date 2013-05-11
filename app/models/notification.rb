class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :time, type: Time

  embedded_in :event
end
