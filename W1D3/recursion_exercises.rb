def upcase(string)
  if string.length == 1
    string.capitalize
  else
    string[0].capitalize + upcase(string[1...string.length])
  end
end

def quick_sort(array)
  return array if array.length <= 1
  split = array.partition{ |el| el < array[0] }.to_a
  quick_sort(split[0]) + [split[1][0]] + quick_sort(split[1][1..-1])
end

def quik_sort(array)
  return array if array.length <= 1
  popped = array.shift
  quik_sort(array.select { |el| el <= popped }) + [popped] + quik_sort(array.select { |el| el > popped })

end

def sum_to(n)
  return nil if n < 0
  return 1 if n <= 1
  n + sum_to(n - 1)
end

def add_numbers(array)
  return array.last if array.length <= 1
  array[0] + add_numbers(array[1..-1])
end

def gamma_fnc(n)
  return nil if n - 1 < 0
  return 1 if n - 1 <= 1

  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return flavors == [favorite] if flavors.length <= 1
  ice_cream_shop([flavors[-1]], favorite) || ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end
