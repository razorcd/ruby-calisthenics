module FunWithStrings
  def palindrome?
    # your code here
    pol = self.gsub(/[^a-z]/i,'')
    pol.downcase == pol.downcase.reverse
  end
  def count_words
    # your code here
    words_array = self.downcase.split(/[^a-z]/i)
    words_array.delete('')
    words_hash = {}
    words_array.uniq.each do |k|
      words_hash[k] = words_array.count(k)
    end
    words_hash
  end
  def anagram_groups
    # your code here
    return [] if self.empty?
    words_array = self.downcase.split(/[^a-z]/i)
    words_array.delete('')
    new_words_array = []
    words_array[0..-2].each_with_index do |v,i|
      words_array[i+1..-1].each do |v2|
        puts "Checking: #{v} and #{v2}"
        new_words_array << [v,v2] if v == v2[-1]+v2[0..-2]
        new_words_array << [v,v2] if v2 == v[-1]+v[0..-2]
      end
      puts "******************"
      puts words_array.inspect
      puts new_words_array.inspect
      new_words_array
    end
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
