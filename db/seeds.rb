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

article_size = 100
description = "Hello, World" * 8
Article.insert_all(
  Array.new(article_size) do |i|
  # Array.new(10000) do |i|
    {
      user_id: user.id,
      title: "title#{i}",
      description: description,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

tag_size = 10000
Tag.insert_all(
  Array.new(tag_size) do |i|
    {
      name: "tag_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

ArticleTag.insert_all(
  Array.new(1000) do |i|
    {
      article_id: Array(1..article_size).sample,
      tag_id: Array(1..tag_size).sample,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

SkillCategory.insert_all(
  # Array.new(10000) do |i|
  Array.new(1000) do |i|
    {
      name: "skill_category_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

skill_size = 10000
Skill.insert_all(
  Array.new(10000) do |i|
    {
      user_id: user.id,
      skill_category_id: Array(1..skill_size).sample,
      name: "skill_1_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)