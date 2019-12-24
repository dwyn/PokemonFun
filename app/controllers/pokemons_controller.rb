class PokemonsController < ApplicationController
  
  def index
    @pokemon = Pokemon.all
  end

  def update
    if @pokemon.update_attributes(pokemon_params)
      flash[:success] = 'Pokemon was updated!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # def edit
  #   pokemon = Pokemon.find_by_slug
  #   authorize
  # end
  
  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id
    @pokemon.trainer_id = Trainer.first.id

    if @pokemon.save
      flash[:success] = "Nice job! #{@pokemon.name} was created!"
      redirect_to pokemons_path
    else
      flash[:danger] = "Hmmm try that again."
      render :new
    end
  end

  def show
    @pokemon = Pokemon.find_by_slug(params[:slug])
  end

  def destroy
    if @pokemon.destroy
      flash[:success] = 'Congrats, you destroyed a pokemon😔'
    else
      flash[:warning] = 'I couldnt destroy this pokemon...'
    end
    redirect_to root_path
  end
  # def new
  #   @pokemon = Pokemon.new
  # end

  # def edit
  #    @pokemon = Pokemon.find_by_slug(params[:slug])
  # end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :name,
      :pkmn_type,
      :level,
      :attack,
      :defense, 
      :speed, 
      :pokedex, 
      :sp_attack, 
      :sp_defense
    )
  end

end
