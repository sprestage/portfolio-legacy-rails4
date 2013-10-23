class Post < ActiveRecord::Base
  # TODO: this line was absent in the example posts.rb on Mon, 10/21. For learning about scope
  attr_accessible :content, :title

  # TODO: we added this on Mon, 10/21. For learning about scope
  # belongs_to :author, class_name: "User"
  # scope :published, where(published: true)

  # # TODO: we added this on Mon, 10/21.  For a reminder of class vs instance methods.
  # # class method
  # def self.published
  #   where(published: true)
  # end

  # # TODO: we added this on Mon, 10/21.  For a reminder of class vs instance methods.
  # # instance method
  # def publish!
  #   self.published = true
  #   save!
  # end

end
