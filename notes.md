Models/Migrations:

FARRIER
has_many :appointments
has_many :horses, through :appointments
*Add on* has_many :owners, through :horses
*Add on* has_many :barns, through :owners
t.string :name
t.string :email
t.string :password_digest
t.string :company_name

HORSE
has_many :appointments
belongs_to :farrier
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

*t.date :next_appointment => want to be able to schedule and view this...but is this done through appointments? How to do this?*

APPOINTMENT - Join Table
belongs_to :farrier
belongs_to :horse
*Add on* belongs_to :owner
*Add on* belongs_to :barn
:date
:time

*Potential Add On #1*

OWNER
has_many :horses
has_many :farriers, through: ?
has_many :appointments
has_many :barns, through: horses?
t.string :name
t.string :phone
t.string :email

*Potential Add On #2*

BARN
has_many :horses
has_many :farriers, through: :horses
has_many :owners, through: :horses
has_many :appointments, through: horses??
t.string :name
t.string :phone
t.string :email
