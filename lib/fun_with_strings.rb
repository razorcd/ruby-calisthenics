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
    
    #checking for anagrams
    words_array.permutation(2).each do |pa|
      new_words_array << pa.reverse if pa[0] == pa[1][-1] + pa[1][0..-2]
    end

    #adding non anagram words
    words_array.each do |w|
      new_words_array << [w] if new_words_array.flatten.all? {|t| t!=w}
    end

    new_words_array
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
