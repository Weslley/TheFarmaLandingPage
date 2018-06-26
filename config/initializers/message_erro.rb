ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
	if html_tag =~ /<(input|textarea|select)/
		%|#{html_tag.gsub("form-control", "form-control error")} <span class=" text-danger error">#{[instance.error_message].join(', ')}|.html_safe
	else
		html_tag
	end
end

