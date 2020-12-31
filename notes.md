Add back to horses#show once Appointments relationships are built: 

# <ul>
#   Number of Times Shod: <%=# @horse.appointments.length %>
#     <%# @horse.appointments.each do |appointment| %>
#     <li><%=# link_to appointment.farrier.company_name, farrier_path(appointment.farrier) %></li>
#     <li><%=# link_to appointment.start.strftime("%B %d, %Y at %k:%M"), appointment_path(appointment)%></li>
#   <%# end %>
# </ul>

Add back to appointments#show:

<%= @appointment.start.to_formatted_s(:long) %>
<%= link_to @appointment.horse.name, horse_path(@appointment.horse) %>
<%= link_to @appointment.farrier.first_name, farrier_path(@appointment.farrier) %>

Add back to farriers#show:
<p>My Appointments:</p>
<% @farrier.appointments.each do |appointment| %>
  <%= link_to appointment.start.strftime("%B %d, %Y at %k:%M"), appointment_path(appointment) %>
  <%= link_to appointment.horse.name, horse_path(appointment.horse) %>
  <br>
<% end %>

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
has_many :farriers, through: :appointments
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

*t.date :next_appointment => want to be able to schedule and view this...but is this done through appointments? How to do this?*

APPOINTMENT - Join Table
belongs_to :farrier
belongs_to :horse
*Add on* belongs_to :barn
*Add on* belongs_to :owner => I DON'T THINK I NEED THIS
t.datetime :start
t.datetime :end
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

Views:

1) '/' => sessions/home: Explains purpose of app.
  a) Top Nav Bar when user not logged in:
    Home, Sign-Up, Log-In
  b) Top Nav Bar when user logged in:
    Home, Farrier's Profile page, Log Out

Add to View/Layouts/Application:
<% if current_farrier %>
  <a class="navbar-brand" href="<%= farrier_path(current_farrier) %>"><%= current_farrier.first_name %>'s profile</a>
  <a class="navbar-brand" href="/logout">Log Out</a>
<% else %>
  <a class="navbar-brand" href="<%= new_farrier_path %>">Sign Up</a>
  <a class="navbar-brand" href="/login">Log In</a>
<% end %>

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
  b) farriers/:id/appointments => View all of that farrier's appointments, both past and upcoming
  c) horses/:id/appointments => View that horse's appointments

