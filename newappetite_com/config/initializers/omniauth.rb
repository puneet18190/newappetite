Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '719477081416715', '19a8f746ef176e1c08e009fae83b7284'
    #provider :twitter, 'yzRfiJUDgdN7CtcuWce7fXWfC', 'JRNmH3CIsYQMAoh2lx1nYd8DJ5ZW9xblE2vCeWYIycqzZEEtUu'
end