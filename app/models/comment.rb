class Comment < ActiveRecord::Base
  belongs_to :previous_state, class_name: "State"
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  belongs_to :state

  scope :persisted, -> { where.not(id: nil) }

  validates :text, presence: true
  delegate :project, to: :ticket
  before_create :set_previous_state
  after_create :set_ticket_state

  private 

    def set_previous_state
      self.previous_state = ticket.state #self.previous_state needed for setter
    end

    def set_ticket_state
      ticket.state = state #self.state not needed for getter
      ticket.save!
    end
end
