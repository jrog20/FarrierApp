TO DO:

[ ] On app/views/appointments/_form.html.erb, fix drop-down list of horses; when creating a new appointment from a farrier/show page, the horse selection should only by the horses that belong to that farrier.
[ ] Create helper methods: Take logic out of views. Only talks to views (does not touch db)
[ ] Add ability to edit and delete a horse.
[ ] Add edit and delete links/buttons to horses/:id (show) page.

def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

User Story:

As a Farrier I want to catalog information on all my clients (horses) and organize my appointments in order to always be prepared with materials and my time.

Models/Migrations:

FARRIER (USER)
has_many :appointments
has_many :horses
*Add on* has_many :owners, through: :horses
*Add on* has_many :barns, through: :horses
t.string :first_name
t.string :last_name
t.string :username
t.string :email
t.string :password_digest
t.string :company_name

HORSE
belongs_to :farrier
has_many :appointments
*Add on* belongs_to :owner
*Add on* belongs_to :barn
t.string :name
t.boolean :needs_shoes
t.boolean :front_shoes
t.boolean :hind_shoes
t.boolean :winter_shoes
t.boolean :pads
t.integer :shoe_size
t.text :temperament (like comments field)
t.string :schedule (example 6weeks or 8weeks)
t.text :comments
t.integer :farrier_id
*t.integer :owner_id*
*t.integer :barn_id*

APPOINTMENT - Join Table
belongs_to :farrier
belongs_to :horse
*Add on* belongs_to :barn
*Add on* belongs_to :owner
t.datetime :start
t.datetime :end
ADD FIELD => t.date :date
t.text :comments (a place for the Farrier to put notes about this specific appointment)
t.integer :farrier_id
t.integer :horse_id
*t.integer :owner_id*
*t.integer :barn_id*

*Add On #1*

OWNER
has_many :horses
has_many :farriers, through: :horses
has_many :appointments, through: :horses
has_many :barns, through: :horses
t.string :first_name
t.string :last_name
t.string :phone
t.string :email
t.text :comments

*Add On #2*

BARN
has_many :horses
has_many :farriers, through: :horses
has_many :owners, through: :horses
has_many :appointments, through: :horses
t.string :name
t.string :manager_name
t.string :phone
t.string :email
t.string :address
t.string :city
t.string :state
t.string :zip_code
t.text :comments

Views:

1) '/' => sessions/home: Explains purpose of app.
  a) Top Nav Bar when user not logged in:
    Home, Sign-Up, Log-In
  b) Top Nav Bar when user logged in:
    Home, Farrier's Profile page, Log Out

2) /farriers/new => Sign-Up, posts to /farriers/:id
3) /sigin => Log-In, posts to /farriers/:id
4) /farriers/:id => Profile page/List of all horses belonging to the logged in Farrier with links to each horse's name Plus a calendar view by month(?) with all current horses scheduled, also with the ability to click on the horse's name to see that horse's info page.
  -Also on this view, links to create a a) NEW HORSE and b) NEW APPOINTMENT
5) /horses/new => Farrier creates a new horse, entering all available information about that horse
  **-This also includes the ability to add a) HORSE'S OWNER and b) HORSE'S BARN**
6) /horses/:id => Displays all information on that horse as entered by the Farrier, as well as a) a list of all past and upcoming appointments and b) BARN INFO and c) OWNER INFO
7) Log-Out => redirects to home

8) NESTED ROUTES: INDEX
  a) farriers/:id/horses => View a farrier's list of horses
  b) horses/:id/appointments => View that horse's appointments
  c) farriers/:id/appointments => View all of that farrier's appointments, both past and upcoming

