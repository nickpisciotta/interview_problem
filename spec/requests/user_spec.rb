require 'rails_helper'

describe "Retrieve all users" do
  describe "GET #index" do
    it "returns all users" do
      user_one =  create_first_user
      user_two =  create_second_user

      get "/users"

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.count).to eq(2)
      expect(parsed_response[0]["first_name"]).to eq(user_one.first_name)
      expect(parsed_response[0]["last_name"]).to eq(user_one.last_name)
      expect(parsed_response[0]["email"]).to eq(user_one.email)

      expect(parsed_response[1]["first_name"]).to eq(user_two.first_name)
      expect(parsed_response[1]["last_name"]).to eq(user_two.last_name)
      expect(parsed_response[1]["email"]).to eq(user_two.email)
    end
  end
end

describe "Retrieve a specfic user" do
  describe "GET #show" do
    it "returns one user" do
      user_one = create_first_user
      user_two = create_second_user

      get "/users/#{user_one.id}"

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["id"]).to eq(user_one.id)
      expect(parsed_response["first_name"]).to eq(user_one.first_name)
      expect(parsed_response["last_name"]).to eq(user_one.last_name)
      expect(parsed_response["email"]).to eq(user_one.email)
    end
  end
end

describe "Create a user with valid credentials" do
  describe "POST #create" do
    it "creates a new user" do
      user_params = {first_name: "John", last_name: "Doe", email: "john@example.com",
                     social_security_number: "111111111"}

      post "/users", user: user_params

      expect(response).to have_http_status(:created)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["first_name"]).to eq(user_params[:first_name])
      expect(parsed_response["last_name"]).to eq(user_params[:last_name])
      expect(parsed_response["email"]).to eq(user_params[:email])
    end
  end
end

describe "Create a user with invalid credentials" do
  describe "POST #create" do
    it "returns an error message" do
      invalid_user_params = {first_name: "John", last_name: "Doe", email: "john@example.com",
                             social_security_number: "111"}

      post "/users", user: invalid_user_params

      expect(response.status).to eq(400)

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["errors"][0]).to eq("Social security number is invalid")
    end
  end
end
