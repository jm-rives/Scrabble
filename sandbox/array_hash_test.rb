hello = {["A", "E"]=> 1, ["F", "G"]=> 2}

# def finder(input)
def find_value(input)
  hello = {["A", "E"]=> 1, ["F", "G"]=> 2}
  hello.each do |key, value|
    if key.include? input
      return value
    end
  end
end

puts find_value("A")
