#require 'active_support/all'



def winner(*args)
  win_val = {
      "R" => ["L", "C", "R"],
      "P" => ["R", "S", "P"],
      "C" => ["P", "L", "C"],
      "L" => ["S", "P", "L"],
      "S" => ["C", "R", "S"]}
  win_arr =[]
  if args[2] != nil
    if win_val[args[1]].include?(args[0]) && win_val[args[1]].include?(args[2])
      win_arr << args[1] << args[1] << args[1]
    elsif win_val[args[1]].include?(args[0]) && !win_val[args[1]].include?(args[2])
      win_arr << args[1] << args[2] << args[2]
    elsif !win_val[args[1]].include?(args[0]) && win_val[args[1]].include?(args[2])
      win_arr << args[0] << args[0] << args[1]
    elsif !win_val[args[1]].include?(args[0]) && !win_val[args[1]].include?(args[2])
      if win_val[args[0]].include?(args[2])
        win_arr << args[0] << args[0] << args[2]
      else
        win_arr << args[0] << args[2] << args[2]
      end
    end
  elsif args[1] != nil
    if win_val[args[0]].include?(args[1])
      win_arr << args[0] << args[0]
    else
      win_arr << args[1] << args[1]
    end
  #   elsif args[0] != nil
  #   win_arr << args[0]
  end
end

n = 4
val1_w = 0
val2_w = 2

arr = [["P", "P", "P", "P", "P", "C", "C", "C", "C", "C"],
       ["P", "P", "P", "P", "P", "P", "P", "C", "C", "C"]]
win_w = [["P", "P", "P", "P", "P", "C", "C", "C", "C", "C"],
         ["P", "P", "P", "P", "P", "P", "P", "C", "C", "C"]]
win_h = [["P", "P", "P", "P", "P", "C", "C", "C", "C", "C"],
         ["P", "P", "P", "P", "P", "P", "P", "C", "C", "C"]]
#p arr.size
# win_w = arr
# win_h = arr
#win_w = arr.clone
#win_h = arr.clone
#p arr[1].fetch(-1)
while n != 0
  size_h = arr.size
  num = 0
  elem = 0
  while size_h != 0
    val1_w = 0
    val2_w = 2
    size_w = arr[0].size
    while size_w != 0
      size_w = size_w - 1
      p1, p2, p3 = arr[num][val1_w..val2_w]
      p2.nil? ? next : p2
      win_w[num][val1_w..val2_w] = winner(p1, p2, p3)
      val1_w = val1_w + 1
      val2_w = val2_w + 1

    end
    num = num + 1
    size_h = size_h - 1
    #p win_w
  end
  size_h = arr.size
  size_w = arr[0].size
  # val1_h = 0
  # val2_h = 2
  while size_w != 0
    val1_h = 0
    val2_h = 2
    size_h = arr.size
    while size_h != 0
      size_h = size_h - 1
      #pl1, pl2, pl3 = arr[val1_h..val2_h][elem]
       pl1 = arr[val1_h][elem]
       pl2 = arr[val1_h + 1]#[elem]
       pl3 = arr[val1_h + 2]#[elem]
       pl2.nil? ? next : pl2 = pl2[elem]
       pl3.nil? ? pl3 : pl3 = pl3[elem]
      #pl2[elem]
      #pl3[elem]
      #win_h[val1_h..val2_h][elem] = winner(pl1, pl2, pl3)
      test = winner(pl1, pl2, pl3)
      win_h[val1_h][elem] = test[0]
      if win_h[val1_h + 1] != nil
        win_h[val1_h + 1][elem] = test[1]
      end
      if win_h[val1_h + 2] != nil
        win_h[val1_h + 2][elem] = test[2]
      end
      val1_h = val1_h + 1
      val2_h = val2_h + 1

    end
    elem = elem + 1
    size_w = size_w - 1
    #p win_h
  end
  # val1_w = 0
  # val2_w = 2
  # val1_h = 0
  #val2_h = 2
  n = n - 1
  if win_h == win_w
    arr = win_h.map{|a| a}
  else
    arr = win_h.map{|a| win_w.each }
  end

  #p win_w
  #p win_h
  # size_h = arr.size
end
# p arr[0].join
# p arr[1].join
# p win_w
p win_w
p win_h