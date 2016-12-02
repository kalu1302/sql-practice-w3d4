class Question < ActiveRecord::Base
  has_many :answer_choices,
  class_name: :AnswerChoice,
  foreign_key: :question_id,
  primary_key: :id

  belongs_to :poll,
  class_name: :Poll,
  foreign_key: :poll_id,
  primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answer_hash = Hash.new(0)
    # answers = self.answer_choices.includes(:responses)

    answers = self
      .answer_choices
      .select("answer_choices.*, COUNT(responses.id) AS num_responses")
      .joins("LEFT OUTER JOIN responses ON answer_choice_id = answer_choices.id")
      .group("answer_choices.id")

    answers.each do |answer|
      answer_hash[answer.text] = answer.num_responses
    end

    answer_hash
  end
end
