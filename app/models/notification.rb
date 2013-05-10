class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :time, type: Time, :default -> {DateTime.now}

  embedded_in :event
end
