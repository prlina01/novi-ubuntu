class Page < ApplicationRecord

	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser", :required => false
	has_many :sections

	acts_as_list :scope => :subject 
	# Gleda poziciju u odnosu u kom subjectu se nalazi, zbog toga ne dolazi do konflikta
	# strane sa pozicijom 1 u prvom subjectu i strane sa pozicijom 1 u drugom subjectu

	before_validation :add_default_permalink
	after_save :touch_subject

	# validates_presence_of :name
	# validates_length_of :name, :maximum => 255
	# validates_presence_of :permalink
	# validates_length_of :permalink, :within => 3..255
	# validates_uniqueness_of :permalink

	validates :name, :presence => true, :length => { :maximum => 255}
	validates :permalink, :presence => true, :length => { :within => 3..255}, :uniqueness => true

	private
	def add_default_permalink
		if permalink.blank?
			self.permalink = "#{id}-#{name.parameterize}"
		end
	end
	def touch_subject
		subject.touch
	end
end	
