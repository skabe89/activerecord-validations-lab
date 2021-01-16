class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, acceptance: {accept: ["Fiction", "Non-Fiction"]}
  validate :click_baity

  def click_baity
    bait = ["Won't Believe", "Secret", "Guess", "Top [number]"]
    if title && bait.none? {|b| title.match(b)}
      errors.add(:title, "not click-baity enough!!!")
    end
  end
end
