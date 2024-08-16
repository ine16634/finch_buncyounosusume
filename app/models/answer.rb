class Answer < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  belongs_to :question
  has_many :answer_comments, dependent: :destroy
  
  validates :answer_content, presence: true
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


#メモ：rails g model AnswerComment comment:text user_id:integer answer_id:integer

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @answer = Answer.where("answer_content LIKE?","#{word}")
    elsif search == "forward_match"
      @answer = Answer.where("answer_content LIKE?","#{word}%")
    elsif search == "backward_match"
      @answer = Answer.where("answer_content LIKE?","%#{word}")
    elsif search == "partial_match"
      @answer = Answer.where("answer_content LIKE?","%#{word}%")
    else
      @answer = Answer.all
    end
  end
end