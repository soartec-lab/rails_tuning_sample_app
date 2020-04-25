User.create!(Array.new(10) { |i|  { name: "user_#{1}"} })

user = User.find(1)

BlockUser.create!(Array.new(10) { |i|  { user: user } })
Article.create!(
  Array.new(10000) do |i|
    {
      user: user,
      title: "title#{i}",
      description: "description#{i}"
    }
  end
)
Skill.create!(Array.new(100) { |i|  { user: user, name: "skill#{i}" } })
Category.create!(Array.new(100) {  |i|  { name: "skill#{i}" } })

skill = Skill.find(1)
category = Category.find(1)

SkillCategory.create(
  Array.new(100) do |i|
    {
      skill: skill,
      category: category
    }
  end
)