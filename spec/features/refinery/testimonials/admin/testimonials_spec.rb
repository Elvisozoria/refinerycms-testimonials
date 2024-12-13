# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Testimonials" do
    describe "Admin" do
      describe "testimonials", type: :feature do
        refinery_login

        describe "testimonials list" do
          before do
            FactoryBot.create(:testimonial, :quote => "UniqueTitleOne")
            FactoryBot.create(:testimonial, :quote => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.testimonials_admin_testimonials_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.testimonials_admin_testimonials_path

            click_link "Add New Testimonial"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Quote", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Testimonials::Testimonial, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Testimonials::Testimonial, :count)

              expect(page).to have_content("Quote can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:testimonial, :quote => "UniqueTitle") }

            it "should fail" do
              visit refinery.testimonials_admin_testimonials_path

              click_link "Add New Testimonial"

              fill_in "Quote", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Testimonials::Testimonial, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:testimonial, :quote => "A quote") }

          it "should succeed" do
            visit refinery.testimonials_admin_testimonials_path

            within ".actions" do
              click_link "Edit this testimonial"
            end

            fill_in "Quote", :with => "A different quote"
            click_button "Save"

            expect(page).to have_content("'A different quote' was successfully updated.")
            expect(page).not_to have_content("A quote")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:testimonial, :quote => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.testimonials_admin_testimonials_path

            click_link "Remove this testimonial forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Testimonials::Testimonial.count).to eq(0)
          end
        end

      end
    end
  end
end
