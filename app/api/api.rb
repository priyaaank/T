class API < Grape::API

  format :json
  error_format :json

  version 'v1', :using => :header

  rescue_from Mongoid::Errors::DocumentNotFound do |error|
    rack_response({"error" => {"message" => "We did not find what you were looking for", "code" => 404}}.to_json, 404)
  end

  #Places API
  mount Places::APIV1

  #Review API
  mount Reviews::APIV1
  
  #Tips API
  mount Tips::APIV1

  #User API
  mount Users::APIV1

  #Itenerary API

end
