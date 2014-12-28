require 'benchmark'

def fib(n) #recusion
	if n <= 1 then
		return 1
	else
		return (fib(n-1) + fib(n-2))
	end
end

def fib_a(n) #array
	if n > 1 then
		a = [1,1]
		n = n - 1
		while n > 0 do
			a << (a[a.length-2] + a[a.length-1])
			n = n - 1
		end

		return a
	else
		return []
	end
end

def SternBrocot(n, c = -1)
	a = [1,1]
	if c == -1 then c = 1

	if n > 2 then
			n = n - 2

			while n > 0 do
				a << (a[c-1] + a[c])
				a << a[c]
				n = n - 2
				c = c + 1
			end
		end
	end

	return a
end

def to_fractions(a)
	res = ""
	i = 0

	while i < a.length-2 do
		res = res + a[i].to_s + "/" + a[i+1].to_s + ", "
		i += 1
	end
	res = res + a[i].to_s + "/" + a[i+1].to_s

	return res
end

#MEMBERS = 30
#Benchmark.bm do |b|
#	b.report("Recursive") { fib(MEMBERS) }
#	b.report("Array    ") { fib_a(MEMBERS) }
#end

MEMBERS = 1000000
a = SternBrocot(MEMBERS)
puts to_fractions(a).length

#puts a.inspect
#puts to_fractions(a)