\def shorter_path(path)
  stack = []
  path.split('/').each do |dir|
    if dir != ".." && dir != "."
      stack.push(dir)
    elsif dir == '..'
      stack.pop
    end
  end
  stack.join('/')
end

p shorter_path("/users/app_academy_work/curriculumn/ruby/../sql/./../rails")


def bounces(height, bounce, window)
  if (height > 0 && bounce.between?(0,1) && window < height)
    count = 0
    while true
      height *= bounce
      return count if height < window
      count += 1
    end
  end
  -1
end

p bounces(6, 0.66, 1.5)
