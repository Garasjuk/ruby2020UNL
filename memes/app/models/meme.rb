class Meme < ApplicationRecord
  # has_one_attached :image
  has_many :photo
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {minimum: 3}
  validates :description, presence: true, length: {minimum: 10}
  validates :author, presence: true, length: {minimum: 3}
  validates :image, presence: true

  def self.search(params)
    meme = all
    meme = meme.where("author LIKE ?", "%#{params[:search]}%") if params[:search]
    meme

    # if (search)
    #   where (["author LIKE ?", "%#{search}%"])
    #
    # else
    #   paginate :page => @page, :per_page => 8
    # end

  end

end
