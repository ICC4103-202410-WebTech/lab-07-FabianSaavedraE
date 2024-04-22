class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    # Validations
    validates :name, presence: { message: "Name can't be blank" }, uniqueness: { message: "Name must be unique" }
end
