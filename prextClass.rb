
module M
	def log
		puts 'I am from module'
		super
	end
end
class A
		# def self.pre_extend(m)
		# 	# self.singleton_class.define_method :out_extend do 
		# 	# 	m.instance_methods.each do |i|
		# 	# 		self.singleton_class.define_method i.to_sym, m.instance_method(i.to_sym)
		# 	# 		self.send(i.to_sym)
		# 	# 	end
		#   # end
		# end
		def self.pre_extend(m)
			self.singleton_class.define_method :out_extend do 
				# puts m.instance_methods.include?(:log)
				m.instance_method(:log).bind(A.new).call
			end
		end
	
		def log
		 	puts 'class log'
		end
		pre_extend M
end
A.out_extend


module C
	def log
		puts 'in module'
		super
	end
end

class D
	def self.log
		puts 'in class'
	end
end

D.singleton_class.prepend(C)
D.log
# puts A.singleton_clputs ass.instance_methods.include?(:log)
# puts M.class
# puts M.singleton_class

# A.singleton_class.define_method :name, M.instance_method(:log)
# puts A.singleton_class.ancestors
# puts M.instance_method(:log).bind(A.new).call
# A.singleton_class.name

