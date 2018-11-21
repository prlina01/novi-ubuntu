class Subject < ApplicationRecord

		has_many :pages

		# subject.pages << page
		# subject.pages
		# subject.pages.destroy(page)
		# subject.pages.clear
		# subject.pages.size / subject.pages.count


		# validates_presence_of :name
		# validates_length_of :name, :maximum => 255

		validates :name, :presence => true, :length => { :maximum => 255}
end
 