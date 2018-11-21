module DevcampViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; <b>#{name}</b> #{Time.now.year} | #{msg} ".html_safe
    end
  end
end 
