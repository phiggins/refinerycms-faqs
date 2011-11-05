class CreateFaqs < ActiveRecord::Migration

  def up
    create_table :refinery_faqs do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end

    Refinery::User.find(:all).each do |user|
      user.plugins.create(:title => "faqs", :position => (user.plugins.maximum(:position) || -1) +1)
    end

    position = (Refinery::Page.where(:parent_id => nil).maximum(:position) || -1) + 1

    page = Refinery::Page.create(
      :title => "FAQ",
      :link_url => "/faqs",
      :deletable => false,
      :position => position,
      :menu_match => "^/faqs(\/|\/.+?|)$"
    )

    Refinery::Setting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end

  def self.down
    Refinery::UserPlugin.destroy_all(:name => "faqs")

    Refinery::Page.delete_all(:link_url => "/faqs")

    drop_table :refinery_faqs
  end

end
