class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    # Validations
    validates :name, presence: { message: "can't be blank" }
    validates :email, presence: { message: "can't be blank" },
                        uniqueness: { message: "has already been taken" },
                        format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email format is invalid" }
    validates :password, presence: { message: "can't be blank" },
                        length: { minimum: 6, message: "must be at least 6 characters long" }

    # Callbacks
    before_save :downcase_email

    private

    # Callback method to downcase the email before saving
    def downcase_email
        self.email = email.downcase
    end
end