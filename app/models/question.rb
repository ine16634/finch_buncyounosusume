class Question < ApplicationRecord
  has_one_attached :image
  
  has_many :answers, dependent: :destroy
  belongs_to :user
  
 validates :question_content, presence: true
 
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
