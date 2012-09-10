class Email
  # attr_accessible :title, :body

  def self.send(address, filling_type)

   	Mail.defaults do
      delivery_method :sendmail
    end

	  from_email = "otrofimo@gmail.com"
		from_name  = "Oleg" 

		Mail.deliver do
			from     "#{address}"
			to       "otrofimo@gmail.com"  #"make_sandwich@generalthings.com"
			subject  "Its Sandwich Time!"
			body     "Hey can you make a fresh #{filling_type} sandwich"
			add_file "app/assets/images/make_me_a_sandwich.jpg"
		end
	end

end
