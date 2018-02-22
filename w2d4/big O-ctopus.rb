fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

new_tiles_array = {}

tiles_array.each_with_index { |el, i| new_tiles_array[el] = i }

class Array

  def sluggish_octopus
    count = 0
    biggest = self[0]
    each do |fish1|
      each do |fish2|
        p count += 1
        biggest = fish2 if fish2.length > fish1.length
      end
    end
    biggest
  end

  def dominant_octopus
    return self if self.length <= 1
    pivot = self.shift
    left = self.select { |el| el.length < pivot.length }
    right = self.select { |el| el.length >= pivot.length }

    p left.o_log_n + [pivot] + right.o_log_n

  end

  def clever_octopus
    biggest = self[0]
    each { |el| biggest = el if el.length > biggest }
    biggest
  end

  def slow_dance(direction)
    each_with_index { |dir, i| return i if dir == direction }
  end

end


  def constant_dance(direction, hash)
    hash[direction]
  end

# p fish_arr.sluggish_octopus
# p fish_arr.dominant_octopus[-1]
# p fish_arr.clever_octopus



p tiles_array.slow_dance("right-down")
p constant_dance("right-down", new_tiles_array)
