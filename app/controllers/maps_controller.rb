class MapsController < ApplicationController
  def show
    render json: Map.find(params[:id]).to_json(full_info)
  end

  private

  def full_info
    {
      :only => [:name,:x_map_size,:y_map_size,:id],
      :include => {
                        :map_tiles => {
                            :only => [:id,:x_coordinate, :y_coordinate],
                            :include => {
                                :tile => {
                                    :only => [:passover,:name]
                                }
                            }
                        }
                    }
    }
  end

end
