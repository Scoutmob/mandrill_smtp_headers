require "mandrill_smtp_headers/version"
require "mandrill_smtp_headers/rails"

module MandrillSmtpHeaders
  def self.mandatory_tags=(tags)
    @@mandatory_tags = [tags].flatten
  end

  def self.mandatory_tags
    @@mandatory_tags || []
  end
end
