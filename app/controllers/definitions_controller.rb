class DefinitionsController < ApplicationController
		before_filter :authenticate_user!, except: [:index]
		add_breadcrumb "words", :words_path
	def index
		add_breadcrumb "definitions", word_definitions_path
		@word = Word.find params[:word_id]
		@definitions = @word.definitions.all
	end
	def new
		add_breadcrumb "new", new_word_definition_path
		@word = Word.find params[:word_id]
		@definition = @word.definitions.new
	end
	def create
		@word = Word.find params[:word_id]
		@definition = @word.definitions.new entry_params

		if @definition.save
			redirect_to action: 'index', controller:'definitions'
		else
			render 'error'
		end
	end
	def show
		@word = Word.find params[:word_id]

		@definition = @word.definitions.find params[:id]
	end

	def edit
		@word = Word.find params[:word_id]
		@definition = @word.definitions.find params[:id]

	end

	def update
		@word = Word.find params[:word_id]
		@definition = @word.definitions.find params[:id]
		if @definition.update_attributes entry_params
			redirect_to action: 'index', controller: 'definitions', id: @definition.id
			flash[:notice] = 'definition edited succesfully!'
		else
			flash[:alert] = 'Something failed'
			render 'edit'
		end
	end

	def destroy
		@word = Word.find params[:word_id]

		@definition = @word.definitions.find params[:id]
		@definition.destroy
		redirect_to action: 'index', controller: 'definitions', id: @definition.id
	end

	def upvote
 		@definition = Definition.find(params[:id])
 		@definition.votes.create
  		redirect_to(words_path)
	end


	private

	def entry_params
		params.require(:definition).permit(:text, :origin, :category, :video, :example)
	end
end
