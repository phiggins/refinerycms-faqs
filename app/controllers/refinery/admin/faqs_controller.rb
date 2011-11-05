module Refinery
  module Admin
    class FaqsController < Refinery::AdminController
      crudify 'refinery/faq', :xhr_paging => true
    end
  end
end
