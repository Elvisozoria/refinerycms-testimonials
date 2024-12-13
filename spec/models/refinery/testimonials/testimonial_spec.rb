require 'spec_helper'

module Refinery
  module Testimonials
    describe Testimonial do
      describe "validations", type: :model do
        subject do
          FactoryBot.create(:testimonial,
          :quote => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:quote) { should == "Refinery CMS" }
      end
    end
  end
end
