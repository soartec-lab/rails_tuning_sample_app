User.create!(Array.new(10) { |i|  { name: "user_#{1}"} })

user = User.find(1)

BlockUser.create!(Array.new(10) { |i|  { user: user } })
Article.create!(
  Array.new(10) do |i|
    {
      user: user,
      title: "title#{i}",
      description: "description#{i}"
    }
  end
)
SkillCategory.create!( Array.new(10) { |i| {name: "skill_category_#{i}" } })

skill_category = SkillCategory.find(1)
Skill.create!(
  # Array.new(30000) do | i|
  Array.new(10
    ) do | i|
    { user: user, skill_category: skill_category,name: "skill#{i}" }
  end
)
