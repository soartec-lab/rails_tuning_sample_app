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
user_caution_size = 3000
UserCaution.insert_all(
  Array.new(user_caution_size) do |i|
    {
      user_id: user.id,   
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

CautionFreeze.insert_all(
  Array.new(user_caution_size) do |i|
    user_caution_id = i + 1 
    {
      user_caution_id: user_caution_id,
      start_time: 7.days.ago,
      end_time: 4.days.ago,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
) 

article_size = 700
description = "Hello, World" * 8
Article.insert_all(
  Array.new(article_size) do |i|
    {
      user_id: user.id,
      title: "title#{i}",
      description: description,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

tag_size = 5000
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
  Array.new(4000) do |i|
    {
      article_id: Array(1..article_size).sample,
      tag_id: Array(1..tag_size).sample,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

skill_category_size = 1500
SkillCategory.insert_all(
  # Array.new(10000) do |i|
  Array.new(skill_category_size) do |i|
    {
      name: "skill_category_#{i}",
      reccomend: [true, false].sample,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)

Skill.insert_all(
  Array.new(3000) do |i|
    {
      user_id: user.id,
      skill_category_id: Array(1..skill_category_size).sample,
      name: "skill_1_#{i}",
      created_at: Time.zone.now,
      updated_at: Time.zone.now
    }
  end
)
