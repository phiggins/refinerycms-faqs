module ::Refinery
  class FaqsController < ::ApplicationController

    before_filter :find_all_faqs
    before_filter :find_page

    def index
      # you can use meta fields from your model instead (e.g. browser_title)
      # by swapping @page for @faq in the line below:
      present(@page)
    end

  protected

    def find_all_faqs
      @faqs = Refinery::Faq.order(:position)
    end

    def find_page
      @page = Refinery::Page.where(:link_url => "/faqs").first
    end

  end
end
