require 'natto'

natto = Natto::MeCab.new
cnt = Hash.new(0)

mapping = {"いちごオレ"=>"名詞"}

while a = gets
  a.chomp!
  # 文頭/文末の", user_name, urlを空文字列に
  a.gsub!(/^"|"$|@\w+?|http.+?\s/, '')
  # 連続した""を"に
  a.gsub!(/""/, '"')
  next if a == ''
  natto.parse(a, feature_constraints: mapping) do |n|
    cnt[n.surface] += 1 unless n.is_eos?
  end
end

cnt.sort_by { |h| -h[1] }.each_with_index do |k, ind|
  puts "#{ind + 1}\t#{k[1]}\t#{k[0]}"
end
