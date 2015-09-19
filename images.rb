require 'indico'
require_relative 'secrets'
Indico.api_key = $API_KEY

def desc_sort
  sort_by{|key, value| value}.reverse
end

path1 = "pictures/1.jpg"
path2 = "pictures/2.jpg"
path3 = "pictures/3.jpg"
path4 = "pictures/4.jpg"
path5 = "pictures/5.jpg"
path6 = "pictures/6.jpg"
path7 = "pictures/7.jpg"

paths = [
path1,
path2,
path3,
path4,
path5,
path6,
path7
]

paths.each_with_index do |filename, index|
  puts index
  puts Indico.fer(filename).instance_eval { desc_sort }
  puts Indico.facial_localization(filename).instance_eval { desc_sort }
  puts Indico.content_filtering(filename).instance_eval { desc_sort }
end
