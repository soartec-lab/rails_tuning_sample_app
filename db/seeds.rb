User.create!(Array.new(10) { |i|  { name: "user_#{1}"} })
BlockUser.create!(Array.new(10) { |i|  { user_id: i } })
Article.create!(
  Array.new(10000) do |i|
    {
      user_id: i,
      title: "title#{i}"},
      description: "description#{i}"
    }
  end
)

