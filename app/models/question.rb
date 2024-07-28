class Question < ApplicationRecord
  has_one_attached :image
  
  has_many :answers, dependent: :destroy
  belongs_to :user
  
  #belongs_to :category
  
 validates :question_content, presence: true
 
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  enum category_method: { before: 0, breeding: 1, knowledge: 2, food: 3, illness: 4, others: 5 }
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @question = Question.where("question_content LIKE?","#{word}")
    elsif search == "forward_match"
      @question = Question.where("question_content LIKE?","#{word}%")
    elsif search == "backward_match"
      @question = Question.where("question_content LIKE?","%#{word}")
    elsif search == "partial_match"
      @question = Question.where("question_content LIKE?","%#{word}%")
    else
      @question = Question.all
    end
  end

  
  
  
  
  
end


# メモ：rails g model QuestionComment comment:text user_id:integer question_id:integer
