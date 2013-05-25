class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  field :time, type: DateTime
  field :marked, type: Boolean, default: false
  embedded_in :event

end
