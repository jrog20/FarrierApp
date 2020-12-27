User Story:

As a Farrier I want to catalog information on all my clients (horses) and organize my appointments in order to always be prepared with materials and my time.

Models/Migrations:

FARRIER (USER)
has_many :appointments
has_many :horses (, through: :appointments??) => I want to be able to access a Farrier's list of horses, regardless of appointments.
*Add on* has_many :owners, through: :horses
*Add on* has_many :barns, through: :owners
t.string :first_name
t.string :last_name
t.string :username
t.string :email
t.string :password_digest
t.string :company_name

HORSE
has_many :appointments
belongs_to :farrier (-OR- has_one :farrier, through: :appointments??)
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

*t.date :next_appointment => want to be able to schedule and view this...but is this done through appointments? How to do this?*

APPOINTMENT - Join Table
belongs_to :farrier
belongs_to :horse
*Add on* belongs_to :owner
*Add on* belongs_to :barn
t.datetime :start
t.datetime :end
t.text :comments (a place for the Farrier to put notes about this specific appointment)
t.integer :farrier_id
t.integer :horse_id
*t.integer :owner_id*
*t.integer :barn_id*

*Potential Add On #1*

OWNER
has_many :horses
has_many :farriers, through: ?
has_many :appointments
has_many :barns, through: horses?
t.string :first_name
t.string :last_name
t.string :phone
t.string :email

*Potential Add On #2*

BARN
has_many :horses
has_many :farriers, through: :horses
has_many :owners, through: :horses
has_many :appointments, through: horses??
t.string :name
t.string :manager_name
t.string :phone
t.string :email
t.string :address
t.string :city
t.string :state
t.string :zip_code

Views:

1) '/' => Home/Welcome: Explains purpose of app.
  a) Top Nav Bar when user not logged in:
    Home, Sign-Up, Log-In
  b) Top Nav Bar when user logged in:
    Home, Farrier's Profile page, Log Out
2) /users/new => Sign-Up, posts to /users/:id
3) /sigin => Log-In, posts to /users/:id
4) /users/:id => Profile page/List of all horses belonging to the logged in Farrier with links to each horse's name Plus a calendar view by month(?) with all current horses scheduled, also with the ability to click on the horse's name to see that horse's info page.
5) /horses/new => Farrier creates a new horse, entering all available information about that horse
6) /horses/:id => Displays all information on that horse as entered by the Farrier, as well as a list of all past and upcoming appointments.
7) Log-Out => redirects to home
8) Should this be nested?
  View a farrier's list of horses => users/:id/horses
  View a specific horse belonging to a farrier => users/:id/horses/:id
9) /users/:id/appointments => View all of that farrier's appointments, both past and upcoming