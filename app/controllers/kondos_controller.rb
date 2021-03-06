class KondosController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :random ]

  def index
    if params[:location].present?
      @kondos = policy_scope(Kondo).near(params[:location], 200, units: :km).order(created_at: :desc).where(active: true)
    else
      @kondos = policy_scope(Kondo).order(created_at: :desc).where(active: true)
    end
    if params[:kondo_id].present?
      @kondo = Kondo.find(params[:kondo_id])
    else
      @kondo = @kondos.sample
    end

    if @kondos
      @markers = [
        {
          lat: @kondo.latitude,
          lng: @kondo.longitude,
          infoWindow: render_to_string(partial: 'info_window', locals: { kondo: @kondo })
        }
      ]
    end

    # if @kondos
    #   @markers = @kondos.map do |kondo|
    #     {
    #       lat: kondo.latitude,
    #       lng: kondo.longitude,
    #       infoWindow: render_to_string(partial: 'info_window', locals: { kondo: kondo })
    #     }
    #   end
    # end

  end

  def random
    if params[:location].present?
      @kondos = policy_scope(Kondo).near(params[:location], 200, units: :km).order(created_at: :desc)
    else
      @kondos = policy_scope(Kondo).order(created_at: :desc)
    end
    @kondo = @kondos.sample

    if @kondos
      @markers = [
        {
          lat: @kondo.latitude,
          lng: @kondo.longitude,
          infoWindow: render_to_string(partial: 'info_window', locals: { kondo: @kondo })
        }
      ]
    end
    render layout: false
    authorize @kondo
  end

  def new
    @kondo = Kondo.new
    if params[:location]
      @location = params[:location]
      @kondo.location = @location
    end
    authorize @kondo
  end

  def create
    @kondo = Kondo.new(set_params)
    @kondo.user = current_user
    if @kondo.save
      redirect_to dashboard_path
    else
      render :new
    end
    authorize @kondo
  end

  def edit
    @kondo = Kondo.find(params[:id])
    authorize @kondo
  end

  def update
    @kondo = Kondo.find(params[:id])
    if @kondo.update(set_params)
      redirect_to dashboard_path
    else
      render :edit
    end
    authorize @kondo
    # no need for app/views/restaurants/update.html.erb
  end

  def reserve
    @kondo = Kondo.find(params[:kondo_id])
    authorize @kondo
    @kondo.reserved = !@kondo.reserved
    @kondo.save!
    redirect_to dashboard_path
  end

  def active
    @kondo = Kondo.find(params[:kondo_id])
    authorize @kondo
    @kondo.active = !@kondo.active
    @kondo.save!
    redirect_to dashboard_path
  end

  def destroy
    @kondo = Kondo.find(params[:id])
    @kondo.user = current_user
    authorize @kondo
    @kondo.delete
    redirect_to dashboard_path
  end

  private

  def set_params
    params.require(:kondo).permit(:title, :description, :location, :image, :reserved)
  end
end
