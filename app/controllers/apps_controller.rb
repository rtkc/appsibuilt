class AppsController < ApplicationController 

  before_action :set_app, only: [:show, :edit, :update]
  def index
    @apps = App.all
  end 

  def show
    @app = App.find(params[:id])
    @comment = Comment.new #Declare new comment in Post/App!!!
  end

  def new
    @app = App.new
  end

  def create
    @app = App.new(app_params)
    @app.creator = current_user

    if @app.save
      flash[:notice] = 'Your app was successfully created.'
      redirect_to apps_path
    else 
      flash[:error] = 'Something went wrong. Please create your app again'
      render :new
    end
  end

  def edit; end

  def update
    @app.creator = current_user
    if @app.update(app_params)
      flash[:notice] = 'Your app was successfully updated.'
      redirect_to apps_path(@app)
    else 
      flash[:error] = 'Something went wrong. Please try updating your app again'
      render :edit
    end
  end

  private
  def app_params
    params.require(:app).permit(:title, :description, :functions, category_ids: [])
  end

  def set_app
    @app = App.find(params[:id])
  end
end