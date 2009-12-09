class Elfie
    
    def call(env)
      method_name = env['PATH_INFO']
      method_name = method_name[1,method_name.length] if method_name.length > 1
      result = send(method_name,env)
      [200, {}, "#{result}"]
    end
    
    def test(env)
      render { env.inspect  }
    end
    
    def yari(env)
      render { "No entres a acá U_U "}
    end

    def ir_pe(env)
      render { "Voy pe, a <a href='http://ir.pe'>Ir.pe</a>"; 1/0}
    end
    
    def titles(env)
      render(env['QUERY_STRING'][7,env['QUERY_STRING'].length]) { "MWAHAHAHAHAHAHAH" }
    end
    
    def otaku(env)
      render { '    <div style="margin-top: -10px; margin-left:-10px; width:100%; height:100%; background-color:black;" id="contenter">
      	    <img src="http://animemanager.com/imgs/comingsoon.png" alt="Anime Manager - Coming Soon" width="280" height="86" />
      	</div>
      '}
    end

    private
    
    def render(title = "")
        inner = yield 
        header(title) + inner + footer
    end
    
    def header(title)
      "<html><head><title>Testing</title></head><body><h1>#{title || 'Testing un microframework en 20 lineas'}</h1>"
    end
    
    def footer
      "</body></html>"
    end

    def method_missing(method_name, *args)
      render {"No hay una ruta predefinida para #{method_name}"}
    end
  
end
