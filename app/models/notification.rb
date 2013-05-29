class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  # Callbacks
  before_save :check_text

  field :text, type: String
  field :time, type: DateTime
  field :marked, type: Boolean, default: false
  embedded_in :event

  # Validations
  validates :time, presence: true

  protected
  # Check if notification text is empty
  def check_text
    self.text = self.event.header if self.text.nil?
  end

end
