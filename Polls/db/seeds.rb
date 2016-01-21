# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(user_name: "Stephen")
User.create!(user_name: "Michael")
User.create!(user_name: "Napoleon")
User.create!(user_name: "Cortez")
User.create!(user_name: "Vlad")
User.create!(user_name: "Genghis")
User.create!(user_name: "Kublai")
User.create!(user_name: "Caesar")
User.create!(user_name: "Alexander")
User.create!(user_name: "Attila")

poll = Poll.create!(title: "Places you'd like to conquer next", author_id: User.last.id)

question = Question.create!( poll_id: poll.id, body: "Tropical island location?")
AnswerChoice.create!( question_id: question.id, body: "Bermuda" )
AnswerChoice.create!( question_id: question.id, body: "Jamaica" )
AnswerChoice.create!( question_id: question.id, body: "The Bahamas" )
AnswerChoice.create!( question_id: question.id, body: "Bermuda, again!" )
AnswerChoice.create!( question_id: question.id, body: "Hawaii" )
AnswerChoice.create!( question_id: question.id, body: "The Virgin Islands" )

question = Question.create!( poll_id: poll.id, body: "Weapon of choice?")
AnswerChoice.create!( question_id: question.id, body: "Gladius" )
AnswerChoice.create!( question_id: question.id, body: "Spear" )
AnswerChoice.create!( question_id: question.id, body: "An Axe" )
AnswerChoice.create!( question_id: question.id, body: "The Power Of Persuasion" )
AnswerChoice.create!( question_id: question.id, body: "Howitzer" )
AnswerChoice.create!( question_id: question.id, body: "Fear" )

users_bucket = User.all.shuffle
questions_bucket = Question.all.shuffle

Response.create! user_id: users_bucket.pop.id,
                  question_id: questions_bucket.shift.id,
                  answer_id: AnswerChoice.all.shuffle.first.id


Response.create! user_id: users_bucket.pop.id,
                  question_id: questions_bucket.shift.id,
                  answer_id: AnswerChoice.all.shuffle.first.id
