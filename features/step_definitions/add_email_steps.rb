Then(/^the email should contain (\d+) parts$/) do |arg1|
  current_email.parts.size.should eql(arg1.to_i)
end

Then(/^there should be a part with content type "(.*?)"$/) do |arg1|
  current_email.parts.detect do |p|
		#p "add mail steps #{p.content_type} #{arg1}"
		p.content_type.split(';')[0] == arg1
	end.should_not be_nil
end

