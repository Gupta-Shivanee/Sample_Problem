def tax(k,str)
  array = Array.new
  array = str.map { |n| n.split(" at ") }
  total = 0.0
  sales_taxes = 0.0
  puts "\nOutput #{k}\n"
  array.each do |item,price|
    price = price.to_f
    temp1 = 0.0
    temp2 = 0.0
    temp1 = price * 0.05 if item["imported"]
    temp2 = price * 0.10 unless item["book"] || item["chocolate"] || item["pills"]
    price = (price + temp1 + temp2).round(2)
    puts "#{item}: #{price}"
    total = total + price
    sales_taxes = sales_taxes + temp1 + temp2
  end
  puts "Sales Taxes: #{sales_taxes.round(2)}"
  puts "Total: #{total.round(2)}"
end
str1 = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
str2 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
str3 = ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"]
puts "Input 1 \n"
puts str1
puts "\nInput 2 \n"
puts str2
puts "\nInput 3 \n"
puts str3
tax(1,str1)
tax(2,str2)
tax(3,str3)
