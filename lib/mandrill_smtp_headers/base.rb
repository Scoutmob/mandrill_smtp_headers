require 'multi_json'

module MandrillSmtpHeaders
  module Base

    # Add tags to the outgoing message
    # No more than 50 characters per tag and 100 tags per account.
    def mandrill_tags(*tags)
      set_mandrill_header 'X-MC-Tags', (MandrillSmtpHeaders.mandatory_tags + tags).join(', ')
    end

    # Enable open or click-tracking for the message.
    # :opens - enables open tracking
    # :clicks_all - enables click tracking on all emails
    # :clicks - same as clicks_all
    # :clicks_htmlonly - enables click tracking only on html emails
    # :clicks_textonly - enables click tracking only on text emails
    def mandrill_track(*modes)
      set_mandrill_header 'X-MC-Track', modes.join(', ')
    end

    # Automatically generate a plain-text version of the email from the HTML content.
    def mandrill_enable_autotext
      set_mandrill_header 'X-MC-Autotext', 'on'
    end

    # Automatically generate an HTML version of the email from the plain-text content.
    def mandrill_enable_autohtml
      set_mandrill_header 'X-MC-AutoHtml', 'on'
    end

    # Use an HTML template stored in your Mandrill account.
    # template_name is the name of the stored template.
    # block_name is the name of the mc:edit region where the body of the SMTP generated message will be placed. Optional and defaults to "main".
    def mandrill_template(template_name, block_name = nil)
      set_mandrill_header 'X-MC-Template', [template_name, block_name].compact.join('|')
    end

    # Add dynamic data to replace mergetags that appear in your message content.
    # Multiple instances of this header may be added.
    # Recipient-specific values: add the _rcpt name with the recipient email address as the value, followed by other variable names and their values for that recipient.
    def mandrill_merge_vars(vars = {})
      set_mandrill_header 'X-MC-MergeVars', MultiJson.dump(vars)
    end

    # Add Google Analytics tracking to links in your email for the specified domains.
    def mandrill_google_analytics(*domains)
      set_mandrill_header 'X-MC-GoogleAnalytics', domains.join(', ')
    end

    # Add an optional value to be used for the utm_campaign parameter in Google Analytics tracked links.
    def mandrill_google_analytics_campaign(campaign_name)
      set_mandrill_header 'X-MC-GoogleAnalyticsCampaign', campaign_name
    end

    # Information about any custom fields or data you want to append to the message.  Up to 200 bytes of JSON-encoded data as an object. The object should be flat; nested object structures are not supported.
    def mandrill_metadata(data)
      set_mandrill_header 'X-MC-Metadata', MultiJson.dump(data)
    end

    # Whether to strip querystrings from links for reporting.
    def mandrill_url_strip_qs(enable)
      set_mandrill_header 'X-MC-URLStripQS', (!!enable).to_s
    end
    alias :mandrill_url_strip_query_string :mandrill_url_strip_qs

    # Whether to show recipients of the email other recipients, such as those in the "cc" field.
    def mandrill_preserve_recipients(enable)
      set_mandrill_header 'X-MC-PreserveRecipients', (!!enable).to_s
    end

    # Whether to inline the CSS for the HTML version of the email (only for HTML documents less than 256KB).
    def mandrill_inline_css(enable)
      set_mandrill_header 'X-MC-InlineCSS', (!!enable).to_s
    end

    # Set a custom domain to use for tracking opens and clicks instead of mandrillapp.com.
    def mandrill_tracking_domain(domain_name)
      set_mandrill_header 'X-MC-TrackingDomain', domain_name
    end

    # Set a custom domain to use for SPF/DKIM signing instead of mandrill (for "via" or "on behalf of" in email clients).
    def mandrill_signing_domain(domain_name)
      set_mandrill_header 'X-MC-SigningDomain', domain_name
    end

    # Set a IP Pool to send this email through.
    def mandrill_ip_pool(ip_pool_name)
      set_mandrill_header 'X-MC-IPPool', ip_pool_name
    end

  end
end
