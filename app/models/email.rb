# encoding: binary

class Email < ActionMailer::Base
  # attr_accessible :title, :body

  ## via 
   EmailAddress = begin
    qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
    dtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
    atom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-' +
      '\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
    quoted_pair = '\\x5c[\\x00-\\x7f]'
    domain_literal = "\\x5b(?:#{dtext}|#{quoted_pair})*\\x5d"
    quoted_string = "\\x22(?:#{qtext}|#{quoted_pair})*\\x22"
    domain_ref = atom
    sub_domain = "(?:#{domain_ref}|#{domain_literal})"
    word = "(?:#{atom}|#{quoted_string})"
    domain = "#{sub_domain}(?:\\x2e#{sub_domain})*"
    local_part = "#{word}(?:\\x2e#{word})*"
    addr_spec = "#{local_part}\\x40#{domain}"
    pattern = /\A#{addr_spec}\z/
  end

  def self.valid_email?(address)
  	if address =~ EmailAddress
  		true
  	else
  		false
  	end	
	end

  def self.send(address, filling_type, name)

		return false unless Email.valid_email?(address)

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :login,
        :enable_starttls_auto => true
      }
    end

		Mail.deliver do
			from     "#{address}"
			to       "make_sandwich@generalthings.com"
			subject  "Its Sandwich Time!"
			body     "Hey can you make a fresh #{filling_type} sandwich for #{name}"
			add_file "app/assets/images/make_me_a_sandwich.jpg"
		end

		true
	end
end
