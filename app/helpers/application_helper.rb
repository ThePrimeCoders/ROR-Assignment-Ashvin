module ApplicationHelper
	def current_path?(path)
    	request.fullpath == path
  	end
end
