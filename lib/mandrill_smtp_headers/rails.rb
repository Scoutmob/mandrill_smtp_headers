require 'multi_json'

if defined? ::Rails::Railtie
  require 'mandrill_smtp_headers/rails3'
else
  require 'mandrill_smtp_headers/rails2'
end

