class API < Grape::API

  format :json
  error_format :json

  rescue_from Mongoid::Errors::DocumentNotFound do |error|
    rack_response({"error" => {"message" => "We did not find what you were looking for", "code" => 404}}.to_json, 404)
  end

  #Places API
  mount Places::APIV1
  mount Users::APIV1

  #Review API
  
  #Tips API

  #User API

  #Itenerary API

end
