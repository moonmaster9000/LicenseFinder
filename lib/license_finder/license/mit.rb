class LicenseFinder::License::MIT < LicenseFinder::License::Base
  LICENSE_TEXT = (LicenseFinder::ROOT_PATH + 'templates/MIT-body').read
  HEADER_REGEX = /The MIT License/
  DISCLAIMER_REGEX = /THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT\. IN NO EVENT SHALL ((\w+ ){2,8})BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE\./
  ONE_LINER_REGEX = /is released under the MIT license/
  URL_REGEX = %r{MIT Licence.*http://www.opensource.org/licenses/mit-license}

  def matches_body?
    !!cleaned_up(text).index(cleaned_up(LICENSE_TEXT)) ||
    !!(on_single_line(text) =~ URL_REGEX)
  end

  def matches_header?
    header = text.split("\n").first
    header && ((header.strip =~ HEADER_REGEX) || !!(on_single_line(text) =~ ONE_LINER_REGEX))
  end
end
