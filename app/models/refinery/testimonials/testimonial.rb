require 'refinery/core/base_model'

module Refinery
  module Testimonials
    class Testimonial < Refinery::Core::BaseModel
      self.table_name = 'refinery_testimonials'
      validates :quote, presence: true, uniqueness: true

      acts_as_indexed fields: [:byline]

      def self.random
        offset = 0
        offset = rand(Testimonial.count) unless Testimonial.count == 0
        Testimonial.offset(offset).last
      end

    end
  end
end
