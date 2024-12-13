module Refinery
  module Testimonials
    module Admin
      class TestimonialsController < ::Refinery::AdminController
        before_action :find_all, only: [:index]

        crudify :'refinery/testimonials/testimonial',
                :title_attribute => 'quote'

        def index
          @testimonials = @testimonials.where("byline LIKE '%#{params[:search]}%' OR quote LIKE '%#{params[:search]}%'") if searching?
          @testimonials = @testimonials.paginate({page: params[:page]})
        end

        private
        def find_all
          @testimonials = Testimonial.order("position DESC").all
        end

        # Only allow a trusted parameter "white list" through.
        def testimonial_params
          params.require(:testimonial).permit(:quote, :byline, :position)
        end
      end
    end
  end
end
