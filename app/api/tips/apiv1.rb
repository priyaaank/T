module Tips
  class APIV1 < Grape::API

    resource :tip do
      
      desc "Returns a tip for a given id"
      get "/:id" do
        tip = Tip.find(params[:id])
        present tip, :with => Tips::TipResponseEntity
      end

    end

  end
end
