class PagesController < ApplicationController
   # GET request for / (mit nix hinter slash) which is our home page
   def about
      @basic_plan = Plan.find(1)
      @pro_plan = Plan.find(2)
   end

   def about
   end
end