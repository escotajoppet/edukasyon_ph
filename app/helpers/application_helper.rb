module ApplicationHelper
	def starred_rating(rate=nil, size='1x')
		rating = "<ul data-rate=\"#{rate}\" class=\"rates\">"

    (1..5).each do |i|
      rating += "<li data-star=\"#{i}\" class=\"stars\">#{fa_icon "star #{size}"}</li>"
    end

    rating += '</ul>'

    rating.html_safe
	end
end