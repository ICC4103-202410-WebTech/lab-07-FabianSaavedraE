# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.delete_all

# seeds.rb

# Creating users
5.times do
    User.create(
      name: Faker::Name.unique.name,
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password
    )
end
  
# Creating posts with associated tags
users = User.all

10.times do
    user = users.sample
    post = user.posts.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraphs.join("\n"),
        published_at: Faker::Time.backward(days: 30),
        answers_count: rand(10),
        likes_count: rand(100)
    )

    # Creating at least one tag for each post
    post.tags.create(name: Faker::Lorem.word)

    # Adding additional tags (up to 3) for some posts
    rand(3).times do
        post.tags.create(name: Faker::Lorem.word)
    end
end

# Ensuring each tag is associated with at least one post
tags = Tag.all
tags.each do |tag|
    post = Post.where.not(id: tag.post_id).sample
    tag.update(post_id: post.id)
end
  