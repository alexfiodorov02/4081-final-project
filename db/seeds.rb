# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

User.destroy_all
Profile.destroy_all
Business.destroy_all

# Create users
user1 = User.create!(email: 'alice.smith@example.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(email: 'bob.johnson@example.com', password: 'password', password_confirmation: 'password')
user3 = User.create!(email: 'carmen.lopez@example.com', password: 'password', password_confirmation: 'password')
user4 = User.create!(email: 'david.brown@example.com', password: 'password', password_confirmation: 'password')
user5 = User.create!(email: 'eva.clarke@example.com', password: 'password', password_confirmation: 'password')
user6 = User.create!(email: 'felix.turner@example.com', password: 'password', password_confirmation: 'password')
user7 = User.create!(email: 'grace.lee@example.com', password: 'password', password_confirmation: 'password')
user8 = User.create!(email: 'henry.white@example.com', password: 'password', password_confirmation: 'password')
user9 = User.create!(email: 'isabella.martinez@example.com', password: 'password', password_confirmation: 'password')
user10 = User.create!(email: 'jack.davis@example.com', password: 'password', password_confirmation: 'password')

# Create profiles for each user
profile1 = Profile.create!(user: user1, name: 'Alice Smith', bio: 'A passionate food lover.')
profile2 = Profile.create!(user: user2, name: 'Bob Johnson', bio: 'All about sustainable eating.')
profile3 = Profile.create!(user: user3, name: 'Carmen Lopez', bio: 'Dedicated to exploring global cuisines.')
profile4 = Profile.create!(user: user4, name: 'David Brown', bio: 'Lover of local farms and fresh produce.')
profile5 = Profile.create!(user: user5, name: 'Eva Clarke', bio: 'Baker extraordinaire and dessert enthusiast.')
profile6 = Profile.create!(user: user6, name: 'Felix Turner', bio: 'A connoisseur of fine wines and cheeses.')
profile7 = Profile.create!(user: user7, name: 'Grace Lee', bio: 'Vegan chef and recipe developer.')
profile8 = Profile.create!(user: user8, name: 'Henry White', bio: 'Master of the grill and barbecue techniques.')
profile9 = Profile.create!(user: user9, name: 'Isabella Martinez', bio: 'Seafood aficionado and ocean lover.')
profile10 = Profile.create!(user: user10, name: 'Jack Davis', bio: 'Adventurous eater always looking for the next challenge.')

# Create businesses
business1 = Business.create!(
  user: user1,
  name: 'Alice\'s Bistro',
  address: '100 First St, Metropolis, USA',
  restaurant_type: 'French Bistro',
  bio: 'Authentic French cuisine in a cozy setting.',
  menu: 'Croissants, Coq au Vin, Crème Brûlée'
)

business2 = Business.create!(
  user: user2,
  name: 'Bob\'s Burger Bar',
  address: '200 Second St, Gotham, USA',
  restaurant_type: 'American',
  bio: 'Classic American flavors with a modern twist.',
  menu: 'Classic Burger, BBQ Burger, Veggie Burger'
)

business3 = Business.create!(
  user: user3,
  name: 'Carmen\'s Tapas',
  address: '300 Third St, Star City, USA',
  restaurant_type: 'Spanish',
  bio: 'A vibrant taste of Spain.',
  menu: 'Patatas Bravas, Paella, Sangria'
)

business4 = Business.create!(
  user: user4,
  name: 'David\'s Deli',
  address: '400 Fourth St, Central City, USA',
  restaurant_type: 'Deli',
  bio: 'Fresh, homemade sandwiches and salads.',
  menu: 'Pastrami Sandwich, Caesar Salad, Matzo Ball Soup'
)

business5 = Business.create!(
  user: user5,
  name: 'Eva\'s Patisserie',
  address: '500 Fifth St, Springfield, USA',
  restaurant_type: 'Patisserie',
  bio: 'Sweet and savory pastries to delight.',
  menu: 'Macarons, Éclairs, Quiche'
)

business6 = Business.create!(
  user: user6,
  name: 'Felix\'s Fine Wines',
  address: '600 Sixth St, Rivertown, USA',
  restaurant_type: 'Wine Bar',
  bio: 'An exquisite selection of global wines.',
  menu: 'Pinot Noir, Chardonnay, Cabernet Sauvignon'
)

business7 = Business.create!(
  user: user7,
  name: 'Grace\'s Greenhouse',
  address: '700 Seventh St, Lakeside, USA',
  restaurant_type: 'Vegetarian',
  bio: 'Fresh and local vegetarian delights.',
  menu: 'Stuffed Peppers, Mushroom Risotto, Kale Salad'
)

business8 = Business.create!(
  user: user8,
  name: 'Henry\'s BBQ Haven',
  address: '800 Eighth St, Mountainside, USA',
  restaurant_type: 'Barbecue',
  bio: 'The best BBQ ribs and briskets in town.',
  menu: 'Smoked Ribs, Pulled Pork, Brisket'
)

business9 = Business.create!(
  user: user9,
  name: 'Isabella\'s Seafood Shack',
  address: '900 Ninth St, Beachside, USA',
  restaurant_type: 'Seafood',
  bio: 'Fresh seafood straight from the ocean.',
  menu: 'Grilled Salmon, Lobster Rolls, Clam Chowder'
)

business10 = Business.create!(
  user: user10,
  name: 'Jack\'s Adventure Eats',
  address: '1000 Tenth St, Adventure City, USA',
  restaurant_type: 'International',
  bio: 'Exotic flavors from around the world.',
  menu: 'Sushi, Tacos, Shawarma'
)

puts 'Seed data created successfully!'


  meal_tags = {
    breakfast: Tag.find_or_create_by!(name: 'Breakfast', category: 'meal'),
    lunch: Tag.find_or_create_by!(name: 'Lunch', category: 'meal'),
    dinner: Tag.find_or_create_by!(name: 'Dinner', category: 'meal'),
    snack: Tag.find_or_create_by!(name: 'Snack', category: 'meal')
  }

  cuisine_tags = {
    american: Tag.find_or_create_by!(name: 'American', category: 'cuisine'),
    indian: Tag.find_or_create_by!(name: 'Indian', category: 'cuisine'),
    chinese: Tag.find_or_create_by!(name: 'Chinese', category: 'cuisine'),
    mexican: Tag.find_or_create_by!(name: 'Mexican', category: 'cuisine')
  }

  difficulty_tags = {
    easy: Tag.find_or_create_by!(name: 'Easy', category: 'difficulty'),
    medium: Tag.find_or_create_by!(name: 'Medium', category: 'difficulty'),
    hard: Tag.find_or_create_by!(name: 'Hard', category: 'difficulty'),
    expert: Tag.find_or_create_by!(name: 'Expert', category: 'difficulty')
  }

  dietary_tags = {
    gluten_free: Tag.find_or_create_by!(name: 'Gluten Free', category: 'dietary'),
    vegan: Tag.find_or_create_by!(name: 'Vegan', category: 'dietary'),
    low_carb: Tag.find_or_create_by!(name: 'Low Carb', category: 'dietary')
  }

  posts_data = [
    {
      title: 'Grandma\'s Apple Pie',
      description: "A classic dessert with a sweet and tangy filling.",
      ingredients: "- 1 pie crust\n- 6 cups of peeled and sliced apples\n- 1 cup of sugar\n- 2 tablespoons of all-purpose flour\n- 1/2 teaspoon of ground cinnamon\n- 1/4 teaspoon of ground nutmeg\n- 1 tablespoon of lemon juice",
      directions: "1. Preheat your oven to 375 degrees F (190 degrees C).\n2. Place the apple slices into the pie crust.\n3. Mix the sugar, flour, cinnamon, nutmeg, and lemon juice in a bowl, then pour over the apples.\n4. Bake for about 50 minutes, or until the crust is golden brown.",
      user: user1,
      tags: [
        meal_tags[:snack],
        cuisine_tags[:american],
        difficulty_tags[:medium],
        dietary_tags[:gluten_free]
      ]
    },
    {
      title: 'Chicken Tikka Masala',
      description: "A popular Indian dish with a creamy tomato sauce.",
      ingredients: "- 500g boneless chicken, cut into pieces\n- 1 cup yogurt\n- 1 tablespoon lemon juice\n- 2 teaspoons cumin\n- 1 teaspoon cinnamon\n- 2 teaspoons cayenne pepper\n- 2 teaspoons black pepper\n- 1 tablespoon ginger\n- 1 teaspoon salt\n- 3 cloves garlic, minced\n- 1 onion, diced\n- 2 cups tomato sauce\n- 2 cups cream",
      directions: "1. Marinate the chicken in the yogurt, lemon juice, and spices for an hour.\n2. Saute the garlic and onions in a pan, then add the tomato sauce and cream.\n3. Add the chicken and simmer for 20 minutes.",
      user: user2,
      tags: [
      meal_tags[:dinner],
      cuisine_tags[:indian],
      difficulty_tags[:hard],
      dietary_tags[:gluten_free]
  ]
},
  {
      title: 'Vegetable Stir Fry',
      description: "A quick and healthy meal packed with veggies.",
      ingredients: "- 2 tablespoons vegetable oil\n- 1 onion, sliced\n- 2 cloves garlic, minced\n- 1 bell pepper, sliced\n- 1 carrot, sliced\n- 1 zucchini, sliced\n- 2 tablespoons soy sauce",
      directions: "1. Heat the oil in a wok or large frying pan.\n2. Add the onion and garlic and stir-fry for 2 minutes.\n3. Add the rest of the vegetables and stir-fry for another 5 minutes.\n4. Add the soy sauce and stir-fry for another 2 minutes.",
      user: user3,
      tags: [
      meal_tags[:lunch],
      cuisine_tags[:chinese],
      difficulty_tags[:easy],
      dietary_tags[:vegan]
    ]
},
  {
      title: 'Beef Tacos',
      description: "Delicious tacos with seasoned beef and fresh toppings.",
      ingredients: "- 1 lb ground beef\n- 1 packet taco seasoning\n- 1/2 cup water\n- 12 taco shells\n- 1 cup shredded lettuce\n- 1 cup diced tomatoes\n- 1/2 cup shredded cheese",
      directions: "1. Brown the ground beef in a skillet, then drain the fat.\n2. Add the taco seasoning and water, then simmer for 5 minutes.\n3. Spoon the beef into the taco shells, then top with lettuce, tomatoes, and cheese.",
      user: user4,
      tags: [
      meal_tags[:dinner],
      cuisine_tags[:mexican],
      difficulty_tags[:easy],
      dietary_tags[:low_carb]
  ]
},
  {
      title: 'Blueberry Pancakes',
      description: "Fluffy pancakes bursting with blueberries.",
      ingredients: "- 1 cup all-purpose flour\n- 1 tablespoon sugar\n- 1 teaspoon baking powder\n- 1/2 teaspoon baking soda\n- 1/4 teaspoon salt\n- 3/4 cup buttermilk\n- 1/4 cup milk\n- 1 egg\n- 2 tablespoons butter, melted\n- 1 cup fresh blueberries",
      directions: "1. Mix the dry ingredients in a bowl.\n2. In another bowl, mix the buttermilk, milk, egg, and melted butter, then add to the dry ingredients.\n3. Stir in the blueberries.\n4. Pour 1/4 cup of batter onto a hot griddle for each pancake. Cook until bubbles form on the surface, then flip and cook until golden brown.",
      user: user5,
      tags: [
      meal_tags[:breakfast],
      cuisine_tags[:american],
      difficulty_tags[:medium],
      dietary_tags[:vegan]
  ]
}
  ]
  



  images_folder_path = Rails.root.join('app', 'assets', 'images')

  image_files = {
    'Grandma\'s Apple Pie' => 'Apple_pie.jpg',
    'Chicken Tikka Masala' => 'chicken-tikka-masala.jpg',
    'Vegetable Stir Fry' => 'Vegetable-Stir-Fry.jpg',
    'Beef Tacos' => 'Ground-Beef-Tacos.jpg',
    'Blueberry Pancakes' => 'Blueberry-Pancakes.jpg'
  }

  posts_data.each do |post_data|
    post = Post.create!(
      title: post_data[:title],
      description: post_data[:description],
      ingredients: post_data[:ingredients],
      directions: post_data[:directions],
      user: post_data[:user]
    )

    post.tags = post_data[:tags]

    image_filename = image_files[post_data[:title]]
    image_path = File.join(images_folder_path, image_filename)
    if File.exist?(image_path)
      post.image.attach(io: File.open(image_path), filename: image_filename)
    end

    post.save!
  end

  puts "Seeded #{posts_data.size} posts with images."
