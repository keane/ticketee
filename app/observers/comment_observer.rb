class CommentObserver < ActiveRecord::Observer
	@@called = 0
	def after_create(comment)
		@@called += 1
		#p "comment_observer #{comment.ticket.watchers.inspect} #{comment.user}"
		users = comment.ticket.watchers - [comment.user]
		#p "comment_observer #{users.inspect}"
		users = users.uniq
		users.each do |user|
			#p "comment_observer #{user.inspect} #{@@called} "
			Notifier.comment_updated(comment, user)
			#p "comment_observer #{ActionMailer::Base.deliveries.inspect}"
		end
	end
end
