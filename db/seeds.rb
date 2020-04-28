introduction = "Hello, World" * 10
User.insert_all(
  Array.new(10) do |i|
    {
      name: "user_#{1}",
      introduction: introduction,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

user = User.find(1)

BlockUser.insert_all(
  Array.new(10) do |i|
    {
      user_id: user.id,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

description = "Hello, World" * 8
Article.insert_all(
  Array.new(100) do |i|
    {
      user_id: user.id,
      title: "title#{i}",
      description: description,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)
Tag.insert_all(
  Array.new(1000) do |i|
    {
      name: "tag_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

Article.all.each do |article| 
  Tag.all.sample(30).each do |tag|
    ArticleTag.create!(article_id: article.id, tag_id: tag.id)
  end
end

SkillCategory.insert_all(
  Array.new(10000) do |i|
    {
      name: "skill_category_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)
Skill.insert_all(
  Array.new(200000) do |i|
    {
      user_id: user.id,
      name: "skill_1_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

SkillCategory.all.sample(10).each do |skill_category|
  Skill.all.sample(5).each do |skill|
    skill.update!(skill_category: skill_category)
  end 
end