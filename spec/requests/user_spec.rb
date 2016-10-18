require 'rails_helper'

describe "Retrieve all users" do
  describe "GET #index" do
    it "returns all users" do
      user_one =  create_first_user                        email: "john@example.com", social_security_number: "111111111")
      user_two =  create_second_user

      get "/users"

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.count).to eq(2)
      expect(parsed_response[0]["first_name"]).to eq(user_one.first_name)
      expect(parsed_response[0]["last_name"]).to eq(user_one.last_name)
      expect(parsed_response[0]["email"]).to eq(user_one.email)
      expect(parsed_response[0]["social_security_number"]).to eq(user_one.social_security_number)
      expect(parsed_response[1]["first_name"]).to eq(user_two.first_name)
      expect(parsed_response[1]["last_name"]).to eq(user_two.last_name)
      expect(parsed_response[1]["email"]).to eq(user_two.email)
      expect(parsed_response[1]["social_security_number"]).to eq(user_two.social_security_number)
    end
  end
end

# describe "Retrieve a specfic user" do
#   describe "GET #show" do
#     it "returns one user" do
#
#     end
#   end
# end
