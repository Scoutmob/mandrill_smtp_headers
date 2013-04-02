require 'mandrill_smtp_headers/base'

module MandrillSmtpHeaders
  module Rails3
    include Base

    protected
      def set_mandrill_header(name, value)
        self.headers[name] = value
      end
  end

  class Railtie < ::Rails::Railtie
    initializer 'mandrill_smtp_headers.configure_action_mailer' do
      ActionMailer::Base.send(:include, ::MandrillSmtpHeaders::Rails3)
    end
  end
end


