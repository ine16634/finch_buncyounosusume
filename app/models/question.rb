class Question < ApplicationRecord
  has_one_attached :image
  
  has_many :answers, dependent: :destroy
  belongs_to :user
  
  has_many :categories, dependent: :destroy
  
 validates :question_content, presence: true
 
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  enum category_method: { before: 0, breeding: 1, knowledge: 2, food: 3, illness: 4, others: 5 }
  
end
