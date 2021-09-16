# frozen_string_literal: true

# Service for swap words def
class SwapService
  class << self

    def initialize(post)
      @post = post
    end

    def execute(string)
      # creating a hash to collect all of the keynotes in right format
      all_keynotes = Hash[(KeynoteStore.get_keynotes.values.map{|x| x[:key]}).zip(KeynoteStore.get_keynotes.values.map{|x| x[:link]})].transform_keys(&:downcase)

      string.split
               .chunk(&:downcase)
               .flat_map do |link,a|
        a.flat_map.with_index do |key,i|
          # 'if' statement created to limit creating hyperlinks for each of the keywords from hash in 2
          if i < 2 && all_keynotes.key?(link)
            "<a href = #{all_keynotes[link]}>#{key}</a>"
          else
            key
          end
        end
      end.join(' ')
    end

  end
end
