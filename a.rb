require 'natto'

natto = Natto::MeCab.new('-E""')
cnt = {}

loop do
  a = gets
  break unless a
  a.chomp!
  # 文頭/文末の", user_name, urlを空文字列に
  a.gsub!(/^"|"$|@[A-Za-z0-9_]+?|http.+?\s/, '')
  # 連続した""を"に
  a.gsub!(/""/, '"')
  next if a == ''
  natto.parse(a) do |n|
    next if n.is_eos?
    cnt[n.surface] ||= 0
    cnt[n.surface] += 1
  end
end

cnt.sort_by { |h| -h[1] }.each_with_index do |k, ind|
  puts "#{ind + 1}\t#{k[1]}\t#{k[0]}"
end
