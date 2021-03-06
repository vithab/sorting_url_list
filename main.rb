strings = File.readlines('input_files/input_strings.txt')
          .map(&:chomp).reject!(&:empty?).uniq

urls = strings.map { |string| string.split(', ') }.flatten.uniq.sort

puts '='*40

urls.each do |url| 
  File.write("./output_files/urls.txt", "#{url}\n", mode: 'a')
  p url
end


puts '='*40
puts "Всего уникальных урлов: #{urls.count}"
