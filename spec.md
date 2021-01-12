# Specifications for the Rails Assessment

Specs:

- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y) 
=> Farrier has_many :horses
=> Horse has_many :appointments

- [x] Include at least one belongs_to relationship (x belongs_to y) 
=> Horse belongs_to :farrier
=> Appointment belongs_to :horse

- [x] Include at least two has_many through relationships (x has_many y through z)
=> Farrier has_many :owners, through: :horses
=> Farrier has_many :barns, through: :horses

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z)
=> Barn has_many :farriers, through: :horses
=> Farrier has_many :barns, through: :horses

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
=> Horse: :name, (plus 9 more)

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item
=> Farrier, Horse, Owner, Barn

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

=> Horse.shoes_this_week URL: /horses/shoes_this_week
Page lists shoe inventory needed for horse appointments this week

=> Horse.shoes_list URL: /horses/shoes_list
Page lists inventory needed for all horses, by shoe size

*OPTIONS*
=> Return things in order: 
  - Horse's appointments in order
  - Complete list of a farrier's upcoming appointments, in order by...
    - Barn?, Date?

=> Horse.oldest_client URL: /horses/oldest_client

=> Horse.most_appointments URL: /horses/most_appointments

* if need help w/scope method: Review MyBlog Post.rb model

# First, scope method can only view attributes for that model, so must join w/other migration that you want to include attributes:
Horse.joins(:appointments) 

# Second, must group the items by the id attribute if you want anything other than a count of everything
Horse.joins(:appointments).group(:id) => groups each Horse's appointments together

# Finally, order them by the Horse w/the most appointments
Horse.joins(:appointments).group(:id).order('count(horses.id) desc')

- [x] Include signup

- [x] Include login

- [x] Include logout
 
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
=> OmniAuth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
=> farriers/:id/horses

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
=> horses/:id/appointments/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
=> /horses/new => horse name, barn name, owner name
=> /horse/:id/appointments/new => appointment date

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate