class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 50}
  validates :summary, length: {in: 5..100}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }  #found @ guides.rubyonrails.org/active_record_validations.html#inclusion
  validate :is_clickbait?

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/, /Guess/]


  def is_clickbait? 
    errors.add(:title, "must be clickbait") if CLICKBAIT.none? {|c| c.match title}
  end 


end



