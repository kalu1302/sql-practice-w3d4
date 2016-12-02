class Response < ActiveRecord::Base

  validate :not_duplicate_response, :rigging_polls

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "You've already answered this question!"
    end
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end


  def rigging_polls
    if self.question.poll.author.id == self.user_id
      errors[:user_id] << "You cannot answer your own question!"
    end
  end

  belongs_to :answer_choice,
  class_name: :AnswerChoice,
  foreign_key: :answer_choice_id,
  primary_key: :id

  belongs_to :respondent,
  class_name: :User,
  foreign_key: :user_id,
  primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

end
