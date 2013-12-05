class UsersController < ApplicationController
  expose(:users)
  expose(:user, attributes: :user_params)
  expose(:cookie_types) { CookieType.all }

  def create
    respond_to do |format|
      if user.save
        format.html { redirect_to user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: user }
      else
        format.html { render action: 'new' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user = User.find(params[:id])
    respond_to do |format|
      if user.update_attributes(user_params)
        format.html { redirect_to user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    binding.pry
    user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
