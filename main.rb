# arr[k][max_weight] - max cost for first k items in max_weight backpack

WEIGHTS = [3,4,5,8,9]
COSTS = [1,6,4,7,6]

def fill_function(k, max_weight)
  arr = Array.new(k + 1) { Array.new(max_weight) }

  (k + 1).times { |i| arr[i][0] = 0 }
  max_weight.times { |j| arr[0][j] = 0 }

  1.upto(k) do |i|
    1.upto(max_weight - 1) do |j|
      if j >= WEIGHTS[i - 1]
        arr[i][j] = [arr[i - 1][j], arr[i - 1][j - WEIGHTS[i - 1]] + COSTS[i - 1]].max
      else
        arr[i][j] = arr[i - 1][j]
      end 
    end
  end

  arr
end


def find_answer(arr, k, max_weight)
  if arr[k][max_weight - 1] == 0
    return
  elsif arr[k][max_weight - 1] == arr[k - 1][max_weight - 1]
    find_answer(arr, k - 1, max_weight)
  else
    find_answer(arr, k - 1, max_weight - WEIGHTS[k - 1])
    puts k
  end
end

arr = fill_function(5, 13)
find_answer(arr, 5, 13)
