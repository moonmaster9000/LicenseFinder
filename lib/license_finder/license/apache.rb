class LicenseFinder::License::Apache < LicenseFinder::License::Base
  LICENSE_TEXT = (LicenseFinder::ROOT_PATH + 'templates/Apache-2.0-body').read

  def matches?
    !!on_single_line(text).index(on_single_line(LICENSE_TEXT))
  end
end
