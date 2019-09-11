class Person
	attr_accessor :name, :age
	attr_reader :status

	def happy
		@status = "I'm happy"
	end

	def sad
		@status = "I'm sad"
	end
end