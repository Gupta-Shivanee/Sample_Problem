module Importable
  def Importable.imported(price)
    price = price * 0.05
    price
  end
end
class Parent
  def tax(str)
    array = Array.new
    array = str.map { |n| n.split(" at ")}
    total = 0.0
    sales_taxes = 0.0
    puts "\nOutput\n"
    array.each do |item,price|
      price = price.to_f
      temp1 = 0.0
      temp2 = 0.0
      if item["imported"]
        temp1 = Importable.imported(price)
      end
      unless item["book"] || item["chocolate"] || item["pills"]
        temp2 = price * 0.10
      end
      price = (price + temp1 + temp2).round(2)
      puts "#{item}: #{price}"
      total = total + price
      sales_taxes = sales_taxes + temp1 + temp2
    end
    puts "Sales Taxes: #{sales_taxes.round(2)}"
    puts "Total: #{total.round(2)}"
  end
end
class Child < Parent
  puts "Input: \n format:- 1 item_name at price_value"
  inp = []
  input = gets.chomp
  while input != ''
    inp.push input
    input = gets.chomp
  end
  obj = Child.new
  obj.tax(inp)
end
