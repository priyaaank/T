module Reviews
  class APIV1 < Grape::API
    
    resource :review do

      desc "Returns a Review for a passed id"
      get "/:id" do
        review = Review.find(params[:id])
        present review, :with => Reviews::ReviewResponseEntity
      end

    end

  end
end
