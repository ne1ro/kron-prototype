class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields
  field :header, type: String
  field :description, type: String
  field :rating, type: Integer, default: 0
  field :priority, type: Integer, default: 0
  field :color, type: String, default: 'white'
  field :time, type: DateTime

  # Embedds
  embeds_many :notifications
  embedded_in :user

  # Validations
  validates :time, :header, presence: true
end
