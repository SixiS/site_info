class SiteInfo
  require 'socket'
  require 'open-uri'
  attr_accessor :url, :uri, :stored_favicon, :stored_title
  def initialize(url)
    self.url = url
    self.uri = URI.parse(url)
    raise InvalidURL if uri.host.nil?
  end

  def favicon
    self.stored_favicon || get_favicon
  end

  def get_favicon
    self.stored_favicon = Favicon.new
    self.stored_favicon.image_data = open(%{#{uri.scheme}://#{uri.host}/favicon.ico}).read
    self.stored_favicon
  rescue Errno::ENOENT, ::SocketError
    self.stored_favicon
  end

  def title
    self.stored_title || get_title
  end

  def get_title
    open(url).read =~ /<title>(.*?)<\/title>/
    self.stored_title = $1
  end
end

require "site_info/version"
require "site_info/favicon"
