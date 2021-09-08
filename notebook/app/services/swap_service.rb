# frozen_string_literal: true

# Service for swap words def
class SwapService
  class << self
  include ActionController::Helpers
  include ActionController::Flash

  def initialize(post)
    @post = post
  end

  def execute(string)
      all_keys = KeynoteStore.get_keynotes.values
      keys_arr = all_keys.map{|x| x[:key]}
      links_arr = all_keys.map{|x| x[:link]}
      all_keys = Hash[keys_arr.zip(links_arr)]
      all_keys = all_keys.transform_keys(&:downcase)
      all_keys.each do |key, value|
        count_links = string.to_s.scan(%r{<a href='#{value}'>#{key}</a>}i).size
        next if count_links >= 2

        if count_links == 1
          if string.to_s.scan(/#{key}\s|\s#{key}|\s#{key}\s/i).size.positive?
            string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
              "<a href='#{value}'>#{key.capitalize}</a>"
            end
          end
        else
          string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
            " <a href='#{value}'>#{key.capitalize}</a>"
          end
          string = string.to_s.sub(/#{key}\s|\s#{key}|\s#{key}\s/i) do
            " <a href='#{value}'>#{key.capitalize}</a>"
          end
        end
      end
      string
  end
  end
end
