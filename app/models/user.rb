class User < ApplicationRecord
    include BCrypt

    has_many :categories
    has_many :tasks

    before_validation :email_downcase
    before_create :generate_token

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 8 }

    def self.signup(user_params)
        password_hash = Password.create(user_params[:password])

        create(username: user_params[:username], email: user_params[:email], password: password_hash)
    end

    def generate_token
        self.token = SecureRandom.hex(20)
    end

    def self.login(login_params)
        user = find_by(email: login_params[:email])

        if user.present?
            return user if Password.new(user.password) == login_params[:password]
        end
    end

    private

    def email_downcase
        self.email = email.downcase.strip if email.present?
    end
end
