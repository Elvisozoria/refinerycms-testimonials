module Refinery
  module PageTestimonialsDecorator
    def self.prepended(base)
      base.has_many :appearances, class_name: '::Refinery::Testimonials::Appearance'
      base.has_many :testimonials, -> { distinct },
                    through: :appearances,
                    class_name: "Refinery::Testimonials::Testimonial",
                    inverse_of: :pages

      base.accepts_nested_attributes_for :appearances
    end
  end
end
Refinery::Page.prepend Refinery::PageTestimonialsDecorator