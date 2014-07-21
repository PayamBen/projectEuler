class Integer
  def divisors
    n = self.abs()
    divisors = Array.new

    1.upto(Math.sqrt(n)) { |i| divisors.push(i, n/i) if n % i == 0 }
    divisors.uniq
  end

  def abundant?
    self.abs() < self.divisors.inject(0) { |sum, n| sum + n }  - self.abs()
  end
end

abundant_numbers = Array.new

1.upto(28123) { |num| abundant_numbers.push(num) if num.abundant? }

abundant_numbers.sort!
abundant_sums = Array.new

abundant_numbers.each do |num1|
  abundant_numbers.each do |num2|
    sum = num1 + num2
    break if sum > 28123
    abundant_sums.push(sum)
  end
end

puts ((1 .. 28123).to_a - abundant_sums).inject(0) { |sum, n| sum + n }
