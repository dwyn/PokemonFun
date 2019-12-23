class Pokemon < ApplicationRecord
  before_create :default_image
  belongs_to :trainer
  belongs_to :user
  has_one_attached :image
  
  slug :name

  private
  def default_image
    self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'placeholder-icon.png')), filename: 'default-image.png', content_type: 'image/png')
  end
end
