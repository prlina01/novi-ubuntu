class Blog
  def intialize(title:title, body:body, created_at: created_at) 
    @title = title
    @body = body
    @created_at =  created_at
  end
  
  def made_ago?(created_at)
    Time.now.days - @created_at 
  end

end

b = Blog.new title:1, body:5, created_at: 15 
p b 

