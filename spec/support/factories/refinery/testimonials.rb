
FactoryBot.define do
  factory :testimonial, :class => Refinery::Testimonials::Testimonial do
    sequence(:quote) { |n| "refinery#{n}" }
  end
end

