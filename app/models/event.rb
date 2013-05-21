class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :header, type: String
  field :description, type: String
  field :rating, type: Integer
  field :time, type: DateTime

  embeds_many :notifications
  embedded_in :user

  # Callbacks
  before_save :check_header, :if => :header?
  before_save :check_time, :if => :time?
  before_update :check_header, :if => :header?
  before_update :check_time, :if => :time?

  def header?
    header.blank?
  end

  def time?
    time.nil?
  end

  protected
    def check_header
      # Default value for header
      self.header = 'My event'
    end

    def check_time
      # Set default time
      self.time = DateTime.now
    end

end
