class Comment < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :author, class_name: "User"
  scope :persisted, -> { where.not(id: nil) }

  validates :text, presence: true
  delegate :project, to: :ticket
end
