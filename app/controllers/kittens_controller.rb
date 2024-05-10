class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end
  
  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

def show
  @kitten = Kitten.find(params[:id])
end

def update
  @kitten = Kitten.find(params[:id])

  if @kitten.update(kitten_params)
    flash[:notice] = "kitten was updated successfully"
    redirect_to @kitten
  else
    render "edit"
  end
end 
# shows exact same code for updating a form
# https://stackoverflow.com/questions/42844615/rails-update-method-not-saving-form-data


def destroy
  @kitten = Kitten.find(params[:id])

  @kitten.destroy
  # if @kitten.destroy 
  #   flash[:success] = "kitten was deleted"
  # else
  #   flash[:error] = "failed to delete"
  # end
  
  redirect_to root_path

end



private

def kitten_params
  params.require(:kitten).permit(:name, :age, :cuteness, :softness)
end
