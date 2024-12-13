class CreateTestimonialsTestimonials < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_testimonials do |t|
      t.string :quote
      t.string :byline
      t.integer :position
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-testimonials"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/testimonials/testimonials"})
    end

    drop_table :refinery_testimonials

  end

end
