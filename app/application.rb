class Application
  
  def call(env)
    @@items = []
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match("/items")
      item_name = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_name}
    else 
      resp.write "Route not found"
      resp.status = 404
    else 
      resp.write item.price
    end
    
    resp.finish
  end
  
end