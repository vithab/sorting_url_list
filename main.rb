strings = File.readlines('input_files/test.txt')
          .map(&:chomp).reject!(&:empty?).uniq

# p strings.map! { |string| string.split('://') }
# p (strings.map do |arr|
#     arr.map { |string| string.split('/') }
#   end)

# => 
# [["https:", "", "www.dns-shop.ru", ", http:", "", "dns-shop.ru", "?city=abinsk"], ...]]
p strings.map! { |string| string.split('/') }
puts '='*40

# [["https:", "", "www.dns-shop.ru", ", http:", "", "dns-shop.ru", "?city=abinsk"], ...]]
p strings.map! { |arr| arr.reject!(&:empty?) }
puts '='*40

# [["https:", "www.dns-shop.ru", "http:", "dns-shop.ru", "?city=abinsk"], ...]]
p (strings.map! do |arr|
    arr.map { |string| string.gsub(', ', '') }
  end)

# [[["https:", "www.dns-shop.ru"], ["http:", "dns-shop.ru"], ["?city=abinsk"]], ...]]]
puts '='*40
p (strings.map! do |arr|
    arr.each_slice(2).to_a
  end)



p strings.count
