class LicenseFinder::License::GPLv2 < LicenseFinder::License::Base
  LICENSE_TEXT = (LicenseFinder::ROOT_PATH + 'templates/GPL-2.0-body').read

  def matches_body?
    !!on_single_line(text).index(on_single_line(LICENSE_TEXT))
  end
end
