# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
    user = User.create(
      photo: 'https://picsum.photos/100',
      name: Faker::Name.name,
      email: Faker::Internet.email,
      bio: Faker::Lorem.sentence,
      password: 'password123'
      
    )
    5.times do
      new_post = Post.create(
        author: user,
        title: Faker::Lorem.sentence,
        text: Faker::Lorem.paragraph
   
        )
        10.times do
          Comment.create(
            post: new_post,
            user_id: user.id,
            text: Faker::Lorem.sentence
          )
        end
      end
end  