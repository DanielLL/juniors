class CookieTypesController < ApplicationController
  expose(:cookie_types)
  expose(:cookie_type, attributes: :cookie_type_params)

  def create
    cookie_type = CookieType.new(cookie_type_params)
    respond_to do |format|
      if cookie_type.save
        format.html { redirect_to cookie_type, notice: 'Cookie type was successfully created.' }
        format.json { render action: 'show', status: :created, location: cookie_type }
      else
        format.html { render action: 'new' }
        format.json { render json: cookie_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    cookie_type = CookieType.find(params[:id])
    respond_to do |format|
      if cookie_type.update_attributes(cookie_type_params)
        format.html { redirect_to cookie_type, notice: 'Cookie type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: cookie_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    cookie_type.destroy
    respond_to do |format|
      format.html { redirect_to cookie_types_url }
      format.json { head :no_content }
    end
  end

  private
    def cookie_type_params
      params.require(:cookie_type).permit(:name, :price)
    end
end
