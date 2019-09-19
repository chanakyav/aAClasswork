def shorter_path(path)
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
