class PagesController < ApplicationController
	def index
	  @articles=Article.all
      @articles.each do |article|
      end
	end

end