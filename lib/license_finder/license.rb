module LicenseFinder::License
  class << self
    def all
      @all ||= []
    end
  end

  class Base
    class << self
      def inherited(descendant)
        LicenseFinder::License.all << descendant
      end

      def slug
        name.gsub(/^.*::/, '').downcase
      end
    end

    attr_reader :text

    def initialize(text)
      @text = text
    end

    def matches?
      matches_body? || matches_header?
    end

    def matches_body?
      false
    end

    def matches_header?
      false
    end

    private

    def on_single_line(text)
      text.gsub(/\s+/, ' ').gsub("'", "\"")
    rescue
      ''
    end

    def without_punctuation(text)
      text.gsub('#', '').gsub(' ', '')
    end

    def cleaned_up(text)
      without_punctuation(on_single_line(text))
    end
  end
end

Dir[File.join(File.dirname(__FILE__), 'license', '*.rb')].each do |license|
  require license
end
