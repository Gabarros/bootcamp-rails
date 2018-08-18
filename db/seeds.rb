
20.times.each do |n|
	puts User.create!(email: "user-numero#{n}@email.com", password: "123456")
	
end