class UrlParser
	def initialize(url)
		@new_url = url
	end

	def scheme
		if @new_url.include?("https:")
			return "https"
		else
			return "http"
		end
	end

	def domain
		start_of_domain = @new_url.index('//') + 2
		end_of_domain = @new_url.index(".com") + 4
		return  @new_url[start_of_domain...end_of_domain]
	end

	def port
		if @new_url.include?("com:")
			find_port = @new_url.index("com:") + 4
			three = @new_url[find_port...find_port + 2]
			if three[2] != "/"
				return @new_url[find_port...find_port + 2]
			else
				return @new_url[find_port...find_port + 2]
			end
		elsif @new_url.include?("https:")
			port = "443"
		else
			port = "80"
		end

	end

	def path
		# words = @new_url.split(/\W+/)
		# find_port = @new_url.index("com:") + 4
		# three = @new_url[find_port...find_port + 2]
		# if three[2] != "/"
		# 	port = @new_url[find_port...find_port + 2]
		# else
		# 	port = @new_url[find_port...find_port + 2]
		# end
		# path = words.index(port) + 1
		# 	return words[path]

		path =@new_url.split("/").last.split("?").first
		if path == ""
			path = nil
		else
			path
		end

	end

	def query_string
		query = {}
		# q_string = [@new_url.index("?"), @new_url.index("#")]
		# the_string = @new_url[q_string[0]...q_string[1]]
		# string_array = the_string.split(/\W+/)
		# query = {string_array[1] => string_array[2]}
		# if string_array.length > 3
		the_string = @new_url.split('?').last.split('#').first
		string_array = the_string.split(/\W+/)
		if string_array.length > 3
			query = {string_array[0] => string_array[1],
			string_array[2] => string_array[3]}
		else
			query = {string_array[0] => string_array[1]}
		end

	end

	def fragment_id
		@new_url.split('#').last
	end
end
#http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat
#https://www.google.com/?q=cat#img=FunnyCat