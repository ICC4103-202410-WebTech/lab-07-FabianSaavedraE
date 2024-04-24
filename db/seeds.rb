# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create!_by!(name: genre_name)
#   end
# Eliminamos datos existentes para evitar duplicados
PostTag.delete_all
Tag.delete_all
Post.delete_all
User.delete_all

User.create!(
    name: 'Siegward',
    email: 'sieg@example.com',
    password: 'password1',
)

User.create!(
    name: 'Solaire',
    email: 'sol@example.com',
    password: 'password2',
)

User.create!(
    name: 'Patches',
    email: 'pat@example.com',
    password: 'password3',
)

User.create!(
    name: 'Andre',
    email: 'and@example.com',
    password: 'password4',
)

User.create!(
    name: 'Greirat',
    email: 'gre@example.com',
    password: 'password5',
)

Post.create!(
    title: 'title1',
    content: 'content1',
    user_id: User.find_by(name: 'Andre').id,
    published_at: '2023-07-11 16:25:38',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title2',
    content: 'content2',
    user_id: User.find_by(name: 'Greirat').id,
    published_at: '2024-11-08 09:12:50',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title3',
    content: 'content3',
    user_id: User.find_by(name: 'Greirat').id,
    published_at: '2023-03-09 18:41:18',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title4',
    content: 'content4',
    user_id: User.find_by(name: 'Patches').id,
    published_at: '2023-11-22 03:55:29',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)
Post.create!(
    title: 'title5',
    content: 'content5',
    user_id: User.find_by(name: 'Patches').id,
    published_at: '2023-01-14 13:49:17',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title6',
    content: 'content6',
    user_id: User.find_by(name: 'Solaire').id,
    published_at: '2022-07-10 12:31:34',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title7',
    content: 'content7',
    user_id: User.find_by(name: 'Solaire').id,
    published_at: '2023-02-19 06:14:27',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title8',
    content: 'content8',
    user_id: User.find_by(name: 'Andre').id,
    published_at: '2024-09-12 00:27:40',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title9',
    content: 'content9',
    user_id: User.find_by(name: 'Siegward').id,
    published_at: '2023-03-27 14:08:48',
    answers_count: rand(0..20),
    likes_count: rand(0..50),
)

Post.create!(
    title: 'title10',
    content: 'content10',
    user_id: User.find_by(name: 'Siegward').id,
    published_at: '2024-03-25 16:00:59',
    answers_count: rand(1..20),
    likes_count: rand(1..50),
    parent_post_id: Post.find_by(title: 'title1').id
)

Tag.create!(
    name: 'dex'
)

Tag.create!(
    name: 'str'
)

Tag.create!(
    name: 'int'
)

Tag.create!(
    name: 'fth'
)

Tag.create!(
    name: 'vit'
)

PostTag.create!(
    post_id: Post.find_by(title: 'title1').id,
    tag_id: Tag.find_by(name: 'dex').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title2').id,
    tag_id: Tag.find_by(name: 'dex').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title3').id,
    tag_id: Tag.find_by(name: 'str').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title4').id,
    tag_id: Tag.find_by(name: 'str').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title5').id,
    tag_id: Tag.find_by(name: 'int').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title6').id,
    tag_id: Tag.find_by(name: 'int').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title7').id,
    tag_id: Tag.find_by(name: 'fth').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title8').id,
    tag_id: Tag.find_by(name: 'fth').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title9').id,
    tag_id: Tag.find_by(name: 'vit').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title10').id,
    tag_id: Tag.find_by(name: 'vit').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title3').id,
    tag_id: Tag.find_by(name: 'vit').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title6').id,
    tag_id: Tag.find_by(name: 'dex').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title7').id,
    tag_id: Tag.find_by(name: 'str').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title1').id,
    tag_id: Tag.find_by(name: 'int').id
)

PostTag.create!(
    post_id: Post.find_by(title: 'title9').id,
    tag_id: Tag.find_by(name: 'str').id
)
