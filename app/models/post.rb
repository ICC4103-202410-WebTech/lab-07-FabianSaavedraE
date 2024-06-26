class Post < ApplicationRecord
    belongs_to :user
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_post, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy
    has_many :post_tags
    has_many :tags, through: :post_tags

    # Validations
    validates :title, presence: { message: "can't be blank" }
    validates :content, presence: { message: "can't be blank" }
    validates :user_id, presence: { message: "can't be blank" }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "count must be greater than or equal to 0" }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "count must be greater than or equal to 0" }

    # Callbacks
    before_validation :set_published_at, on: :create

    private

    def set_published_at
        self.published_at ||= Time.zone.now
    end
end