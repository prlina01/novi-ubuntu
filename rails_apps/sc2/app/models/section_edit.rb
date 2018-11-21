class SectionEdit < ApplicationRecord
	belongs_to :edtior, :class_name = "AdminUser", :foreign_key => "admin_user_id", :required => false
	belongs_to :section, :required => false 
end
