# MandrillSmtpHeaders

Provides convenience methods for setting Mandrill SMTP headers for ActionMailer

## Installation

Add this line to your application's Gemfile:

    gem 'mandrill_smtp_headers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mandrill_smtp_headers

## Usage

Adding this gem will provide convenience methods for setting Mandrill specific
SMTP headers in your ActionMailer class.  For example:

```ruby
def confirm_email(order)
  mandrill_tags :confirm_email
  mandrill_track :clicks
  mandrill_enable_autohtml

  # setup confirmation email
  # ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
