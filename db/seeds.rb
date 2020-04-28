introduction = "Hello, World" * 10
User.create!(
  Array.new(10) do |i|
    { name: "user_#{1}", introduction: introduction}
  end
)

user = User.find(1)

BlockUser.create!(Array.new(10) { |i|  { user: user } })

description = "Hello, World" * 8
Article.create!(
  Array.new(100) do |i|
    {
      user: user,
      title: "title#{i}",
      description: description
    }
  end
)
Tag.create!( Array.new(1000) { |i| {name: "tag_#{i}" } })

Article.all.each do |article| 
  Tag.all.sample(30).each { |tag| ArticleTag.create!(article: article, tag: tag) }
end

SkillCategory.create!( Array.new(1000) { |i| {name: "skill_category_#{i}" } })
Skill.create!(Array.new(50000) { |i| { user: user, name: "skill_1_#{i}" } })

SkillCategory.all.sample(10).each do |skill_category|
  Skill.all.sample(5).each do |skill|
    skill.update!(skill_category: skill_category)
  end 
end