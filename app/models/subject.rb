class Subject < ActiveRecord::Base

	has_many :pages

#	validates_presence_of :name
#	validates_length_of :name, :maximum => 255
#	validates_presence_of :permalink
#	validates_length_of :permalink, :within => 3..255
#	validates_uniqueness_of :permalink

	validates :name, :presence => true,
						:length => { :maximum => 255 }
	validates :permalink, :presence => true,
							:length => { :within => 3..255 },
							:uniqueness => true

	scope :visible, lambda {where(:visible => true) }
	scope :invisible, lambda {where(:visible => false) }
	scope :sorted, lambda {order("subjects.position ASC") }
	scope :newest_first, lambda {order("subjects.created_at DESC") }
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}

end
