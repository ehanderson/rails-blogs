class Post < ActiveRecord::Base
  ##rails 3.2.13 needs attr_accessible because it sucks
  attr_accessible :post, :title
  validates :title, presence: true, 
              length: {minimum: 5}
end
