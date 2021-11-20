strings = File.readlines('input_files/input_strings.txt')
          .map(&:chomp).reject!(&:empty?).uniq

urls = strings.map { |string| string.split(', ') }.flatten.uniq.sort

puts '='*40

urls.each { |url| p url }

puts '='*40
puts "Всего уникальных урлов: #{urls.count}"
