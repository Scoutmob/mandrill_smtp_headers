require 'mandrill_smtp_headers/base'

module MandrillSmtpHeaders
  module Rails2
    include Base

    def self.included(base)
      base.alias_method_chain :create_mail, :mandrill_smtp_headers
    end

    def create_mail_with_mandrill_smtp_headers
      m = create_mail_without_mandrill_smtp_headers
      if @__mandrill_headers
        @__mandrill_headers.each_pair do |k,v|
          m[k] = v
        end
      end
      m
    end

    protected
      def set_mandrill_header(name, value)
        @__mandrill_headers ||= {}
        @__mandrill_headers[name] = value
      end
  end
end

ActionMailer::Base.send(:include, MandrillSmtpHeaders::Rails2)


