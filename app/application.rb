

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            item = req.path.split("/items/").last
            if @@items.find {|a| a.name == item}
            item_class = @@items.find {|a| a.name == item}
            resp.write item_class.price
            else resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
            
        end
        
        
        
        resp.finish
    end

end