require 'wistia'

def random
  (rand * 100).to_i
end

def random_user
  User.all[random]
end

User.create!(facebook_id: '1041670272', full_name: "Eli Block", email: 'eliyahu.block@gmail.com')

100.times do
  user = User.create!(facebook_id: Faker::Number.number(10),
            full_name:    Faker::Name.name,
            email:        Faker::Internet.email,
            gender:       "male",
            image:        Faker::Avatar.image,
            balance:      0)

end


User.all.each do |user|

  Charge.create!(user_id: user.id,
                  amount: 1000,
                  seconds: 10 * Rails.configuration.rate,
                  provider_charge_id: Random.new.rand(100000000))
end

project_id = 'y4yl0wka0g'
project = Wistia::Project.find(project_id)

project.medias.each do |media|
  user_id = random_user.id
  Video.create!(title: media.name,
                description: media.description,
                length_in_seconds: media.duration.to_i,
                user_id: user_id,
                wistia_id: media.hashed_id,
                wistia_delivery_id: media.thumbnail.url[40, 40]
                )

end

Video.all.each do |vid|
  (random * 10).times do
    Play.create!(user_id: User.all[random].id, video_id: vid.id, length_in_seconds: 1000)
  end
end















