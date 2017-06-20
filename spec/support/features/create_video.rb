module Features
  def create_video
    video = Video.create!(title: "Wheel",
                          description: "A short video of a ferris wheel in the distance",
                          user_id: User.first.id,
                          wistia_id: 'cql273s2u1',
                          wistia_delivery_id: 'b3969a1467d469e4630d3100a858772bd6f7dd38',
                          length_in_seconds: '324')
  end
end
