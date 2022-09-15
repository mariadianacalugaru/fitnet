module ControllerMacros
	def login_admin
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			sign_in FactoryBot.create(:admin)
		end
	end
	
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user = FactoryBot.create(:user)
			sign_in user
		end
	end

    def login_pt
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:pt]
			user = FactoryBot.create(:pt)
			sign_in user
		end
	end

end