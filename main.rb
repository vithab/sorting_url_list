strings = File.readlines('input_files/test.txt')
          .map(&:chomp).reject!(&:empty?).uniq

p strings
p strings.count
