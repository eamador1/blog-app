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
 