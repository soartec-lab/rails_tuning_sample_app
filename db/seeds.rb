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
  Array.new(10) do |i|
    {
      user: user,
      title: "title#{i}",
      description: description
    }
  end
)
Tag.create!( Array.new(15) { |i| {name: "tag_#{i}" } })

article = Article.find(1)
Tag.all.each { |tag| ArticleTag.create!(article: article, tag: tag) }

SkillCategory.create!( Array.new(10) { |i| {name: "skill_category_#{i}" } })

skill_category_1 = SkillCategory.find(1)
skill_category_2 = SkillCategory.find(2)
Skill.create!(
  # Array.new(30000) do |i|
  Array.new(10) do |i|
    { user: user, skill_category: skill_category_1,name: "skill_1_#{i}" }
  end
)
Skill.create!(
  # Array.new(30000) do |i|
  Array.new(10) do |i|
    { user: user, skill_category: skill_category_2,name: "skill_1_#{i}" }
  end
)
