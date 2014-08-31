class Book < ActiveRecord::Base


validates :title, presence: true


 scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }


 before_save :set_keywords


  protected
    def set_keywords
      self.keywords = [title, author, descritpion].map(&:downcase).join(' ')
    end



end
