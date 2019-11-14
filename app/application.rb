class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if path.match("/items/Item.name")
      resp.write "#{Item.price}"
    else 
      resp.write "Response Not Found"
      resp.status = 404
    end
    
    resp.finish
  end
  
end