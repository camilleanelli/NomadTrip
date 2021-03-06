class TripsController < AuthenticatedController
  before_action :get_trip, only: [:edit, :update, :destroy]

  def index
    @transportations = current_user.transportations.all
    @trips = current_user.trips.includes(:transportations, :accomodations, :users, :trips_users).order(start_date: :desc).page(params[:page])
  end

  def edit
    # @place = Nomadlist::City.find(params[@trip.city_details]).result[0]
  end

  def update
      @trip.update(params_trips)
      @trip.users << current_user unless current_user.friends.empty?
    if @trip.save
      flash[:notice] = "Your trip has been successfully updated"
      redirect_to trips_path
    else
      render :edit
    end
  end

  def new
    @friends = current_user.friends + current_user.inverse_friends
    @trip = current_user.trips.new
  end

  def create
    @friends = current_user.friends + current_user.inverse_friends
    params_trips["google_info"] = JSON.parse(params_trips["google_info"]) if params_trips["google_info"]
    @trip = Trip.new(params_trips)
    @trip.users << current_user
    if @trip.save
      flash[:notice] = "Your trip has been successfully created"
      redirect_to trips_path
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    flash[:notice] = "Your trip has been successfully deleted"
    redirect_to trips_path
  end

  private

  def get_trip
    @trip = current_user.trips.find(params[:id])
  end

  def params_trips
    params[:trip].permit(:start_date, :end_date, :destination, :longitude, :latitude, :cloudinary_id, :person_number, :image_trip, :city_details, :google_info, :country_name, :city_name, :user_ids => [])
  end



end
