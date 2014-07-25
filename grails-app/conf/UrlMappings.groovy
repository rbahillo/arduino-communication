class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		"//$controller/$action?/$id?(.$format)?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:'user', action:'indexWeb')
        "500"(view:'/error')
	}
}
