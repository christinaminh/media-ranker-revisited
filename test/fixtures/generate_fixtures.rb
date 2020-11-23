10.times do |i|
  puts "user#{i+1}:"
  puts "  username: user#{i+1}"
  puts "  uid: #{rand(100000..999999)}"
  puts "  provider: github"
end