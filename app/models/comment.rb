class Comment < ActiveRecord::Base
	before_create :set_previous_state
	after_create :set_ticket_state
	after_create :creator_watches_ticket
	validates :text, :presence => true
	belongs_to :user
	belongs_to :ticket
	belongs_to :state
	belongs_to :previous_state, :class_name => "State"

	delegate :project, :to => :ticket

private

	def set_ticket_state
		self.ticket.state = self.state
		self.ticket.save!
	end

	def set_previous_state
		self.previous_state = self.state
	end

  def creator_watches_ticket
    self.ticket.watchers << user
  end

end
