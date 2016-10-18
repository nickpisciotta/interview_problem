class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email, presence: true,
                    format:  {with: /@/,
                              message: "Invalid Email format" }
  validates :social_security_number, presence: true,
                                     format: {with: /(?!000)([0-6]\d{2}|7([0-6]\d|7[012]))([ -]?)(?!00)\d\d\3(?!0000)\d{4}/}
end
