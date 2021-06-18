
module M
	def log
		puts 'I am from module too'
	end
	def lag
		puts 'i am from module'
	end
end
class A
	def self.pre_extend(m)
		self.singleton_class.define_method :out_extend do 
			m.instance_methods.each do |i|
				self.singleton_class.define_method i.to_sym, m.instance_method(i.to_sym)
				self.send(i.to_sym)
			end
	         end
	end
	def self.log
		puts 'class log'
	end
	pre_extend M
end
A.out_extend

# A.singleton_class.define_method :name, M.instance_method(:log)
# puts A.singleton_class.ancestors
# puts M.instance_method(:log).bind(A.new).call
# A.singleton_class.name

