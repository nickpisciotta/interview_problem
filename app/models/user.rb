class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email, presence: true,
                    format:  {with: /@/,
                              message: "Invalid Email format" }
  validates :social_security_number, presence: true,
                                     length: { is: 9, message: "is not valid"}
end
