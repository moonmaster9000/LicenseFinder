class LicenseFinder::License::Ruby < LicenseFinder::License::Base
  URL_REGEX = %r{http://www.ruby-lang.org/en/LICENSE.txt}

  def matches_body?
    !!(on_single_line(text) =~ URL_REGEX)
  end
end
