require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:social_security_number) }
  it { should allow_value("example@email.com").for(:email) }
  it { should_not allow_value("exampleemail.com").for(:email) }
  it { should allow_value("111111111").for(:social_security_number) }
  it { should allow_value("111-11-1111").for(:social_security_number) }
  it { should_not allow_value("111").for(:social_security_number) }
  it { should_not allow_value("11-111-1111").for(:social_security_number) }

end
