class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :description, type: String
  field :rating, type: Integer

  embeds_many :notifications
  embeds_many :timers

  # Callbacks
  before_save :check_header, :if => :header?
  before_save :check_timer, :if => :timers?
  before_update :check_header, :if => :header?
  before_update :check_timer, :if => :timers?

  def header?
    header.blank?
  end

  def timers?
    timers.empty?
  end

  protected
    def check_header
      # Default value for header
      self.header = 'My event'
    end

    def check_timer
      # Set current time
      now = DateTime.now; time = self.timers.build(:header => 'Event started at')
      time.year = now.year
      time.month = now.month
      time.day = now.day
      time.wday = now.wday
      time.hour = now.hour
      time.minute = now.minute
    end

end
