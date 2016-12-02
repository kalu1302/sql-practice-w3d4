# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chloe = User.create!(user_name: "chloejchou")
kathy = User.create!(user_name: "kalu")
bob = User.create!(user_name: "admin")

poll1 = Poll.create!(title: "Animals", author_id: bob.id)
poll2 = Poll.create!(title: "Location", author_id: bob.id)
poll3 = Poll.create!(title: "Food", author_id: bob.id)

question1 = Question.create!(text: "Cats or Dogs?", poll_id: poll1.id)
question2 = Question.create!(text: "East or West Coast?", poll_id: poll2.id)
question3 = Question.create!(text: "Ice Cream or Gelato?", poll_id: poll3.id)
question4 = Question.create!(text: "Sweet or Savory?", poll_id: poll3.id)

ac1 = AnswerChoice.create!(question_id: question1.id, text: "Cats")
ac2 = AnswerChoice.create!(question_id: question1.id, text: "Dogs")
ac3 = AnswerChoice.create!(question_id: question2.id, text: "East Coast")
ac4 = AnswerChoice.create!(question_id: question2.id, text: "West Coast")
ac5 = AnswerChoice.create!(question_id: question3.id, text: "Ice Cream")
ac6 = AnswerChoice.create!(question_id: question3.id, text: "Gelato")
ac7 = AnswerChoice.create!(question_id: question4.id, text: "Sweet")
ac8 = AnswerChoice.create!(question_id: question4.id, text: "Savory")

Response.create!(user_id: kathy.id, answer_choice_id: ac1.id)
Response.create!(user_id: chloe.id, answer_choice_id: ac2.id)
Response.create!(user_id: kathy.id, answer_choice_id: ac4.id)
Response.create!(user_id: chloe.id, answer_choice_id: ac3.id)
Response.create!(user_id: kathy.id, answer_choice_id: ac6.id)
Response.create!(user_id: chloe.id, answer_choice_id: ac5.id)
Response.create!(user_id: kathy.id, answer_choice_id: ac8.id)
Response.create!(user_id: chloe.id, answer_choice_id: ac8.id)
