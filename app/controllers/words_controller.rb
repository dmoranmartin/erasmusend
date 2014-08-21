class WordsController < ApplicationController
	  before_filter :authenticate_user!, except: [:index, :random, :starts, :find_words, :find_language]
		  add_breadcrumb "home", :root_path
	def starts
		@words_letter = Word.where('name LIKE?', "#{params[:letter]}%")
	end
	def random
		rand_id = rand(Word.count)
		@word_random = Word.offset(rand_id).first
	end

  	
  	def find_words
		@words_found = Word.where "name LIKE ?", "%#{params[:name].downcase}%"
		if @words_found.empty?
			flash[:alert] = 'Tu palabra no existe aún, ¿quieres crearla? Pincha arriba.'
			@alphabet = ("a".."z").to_a
			redirect_to words_path
			
		else 
			render 'find_words'
		end	
	end

	def find_language
		@words_language = Word.where "language LIKE ?", "%#{params[:language]}%"
		if @words_language.empty?
			flash[:alert] = "No hay nada en #{params[:language]} aún. Aquí tienes las más votadas:"
			@alphabet = ("a".."z").to_a
			redirect_to words_path
		else 
			render 'find_language'
		end	
	end

	def index
		@words = Word.order(name: :asc)
		@words_name = @words.map(&:name)

	
		@alphabet = ("a".."z").to_a
	add_breadcrumb "words", words_path
	end

	def new
		@word = Word.new
		 @word.definitions << Definition.new
		 add_breadcrumb "new", new_word_path
	end

	def create
		@word = Word.new entry_params
		@word.name = params[:word][:name].downcase
		if @word.save
			redirect_to @word
		else
			flash[:alert] = 'Something failed'
			render 'new'
		end
	end

	def show
		@word = Word.find params[:id]
	end

	def edit
		@word = Word.find params[:id]

	end

	def update
		@word = Word.find params[:id]
		if @word.update_attributes entry_params
			redirect_to action: 'index', controller: 'words', id: @word.id
			flash[:notice] = 'Word edited succesfully!'
		else
			flash[:alert] = 'Something failed'
			render 'edit'
		end
	end

	def destroy
		@word = Word.find params[:id]
		@word.destroy
		redirect_to action: 'index', controller: 'words', id: @word.id
	end


	private

	def entry_params
		params.require(:word).permit(:name, :language, definitions_attributes: [:origin, :text, :video, :category, :example])
	end

end

