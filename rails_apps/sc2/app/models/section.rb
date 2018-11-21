class Section < ApplicationRecord

	
	belongs_to :page, :required => false
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	acts_as_list :scope => :page 
	after_save :touch_page

	CONTENT_TYPES = ['text', 'HTML']

	# validates_presence_of :name
	# validates_lenghth_of :name, :maximum => 255
	# validates_inclusion_of :content_type, :in => CONTENT_TYPES,
	# 	:message => "must be one of : #{CONTENT_TYPES.join(',')}"
	# validates_presence_of :content

	validates :name, :presence => true, :length => {:maximum => 255}
	validates :content_type, :inclusion => {:in => CONTENT_TYPES,
	 	:message => "must be one of : #{CONTENT_TYPES.join(',')}"}

	 private
	 def touch_page
	 	page.touch
	 end
end
