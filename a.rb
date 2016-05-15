require 'natto'

natto = Natto::MeCab.new
cnt = {}

loop do
  a = gets
  break unless a
  a.chomp!
  # p a
  a.gsub!(/^"|"$|@[A-Za-z0-9_]+?|http.+?\s/, '')
  a.gsub!(/""/, "\"")
  # p a
  if( a != '' )
    natto.parse(a) do |n|
      if n.surface != ''
        cnt[n.surface] = 0 if cnt[n.surface].nil?
        cnt[n.surface] += 1
      end
    end
  end
end

cnt.sort_by { |h| -h[1] }.each_with_index do |k, ind|
  puts "#{ind + 1}\t#{k[1]}\t#{k[0]}"
end
