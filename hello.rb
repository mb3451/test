class User
	def initialize(name)
		@name = name
	end
	def show
		puts @name
	end
end
class Buyer < User
	def show
		puts "hi"
	end
end
user = Buyer.new("Bilal")
user1 = Buyer.new("Ali")
user2 = Buyer.new("Ahmad")
puts user.show
puts user1.show
puts user2.show
puts Buyer.ancestors
