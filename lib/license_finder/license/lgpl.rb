class LicenseFinder::License::LGPL < LicenseFinder::License::Base
  LICENSE_TEXT = (LicenseFinder::ROOT_PATH + 'templates/LGPL-body').read

  def matches_body?
    !!on_single_line(text).index(on_single_line(LICENSE_TEXT))
  end
end
