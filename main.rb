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

uniq_urls = []

strings.each do |arr|
  arr.each do |arr|
    # p arr
    if arr[0].include?('https:') || arr[0].include?('http:')
      uniq_urls << arr.join('//')
    else
      next
    end
  end
end

p uniq_urls.uniq!
uniq_urls.each { |url| p url }
p uniq_urls.count
