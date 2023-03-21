class User < ApplicationRecord
    include BCrypt

    before_validation :email_downcase

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 8 }

    def self.signup(user_params)
        password_hash = Password.create(user_params[:password])

        create(username: user_params[:username], email: user_params[:email], password: password_hash)
    end

    private

    def email_downcase
        self.email = email.downcase.strip if email.present?
    end
end
