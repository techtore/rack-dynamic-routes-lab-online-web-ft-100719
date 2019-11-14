class Application
  
  def call(env)
    @@items = []
    
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match("/items/")
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
      
      resp.write item.price
    else item.nil?
      resp.write "Item not found"
      resp.status = 400
      
    end
    else 
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
end