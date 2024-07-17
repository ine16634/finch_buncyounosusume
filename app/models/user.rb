class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # validates :name, presence: true, length: { in: 2..20 }
         
  has_one_attached :image_icon
  
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_comments, dependent: :destroy
  
  def get_image_icon(width, height)
    unless image_icon.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jp')
      image_icon.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image_icon.variant(resize_to_limit: [width, height]).processed
  end
         
end
