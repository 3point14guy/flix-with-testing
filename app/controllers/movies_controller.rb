class MoviesController < ApplicationController
  def index
    @movies = Movie.released
    # will try to use later with a variable in the .each loop of the index page
    # variable will get updated w the search type clicked
    @hits = Movie.hits
    @flops = Movie.flops
    @recent = Movie.recent
  end

  def show
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    if @movie.save
      # flash[:notice] = "Movie successfully updated!"
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, danger: "Movie successfully deleted!"
  end

private

def movie_params
  params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image)
end

end
