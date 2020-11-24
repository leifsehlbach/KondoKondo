# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Kondo.destroy_all

puts "Start seeding Users..."


Friddi = User.create!(
    username: "Friddi",
    first_name: "Friedrich",
    last_name: "Hegel",
    email: "Friedrich.Hegel@gmail.com",
    password: "123456"
)

Kalle = User.create!(
    username: "Kalle",
    first_name: "Karl",
    last_name: "Marx",
    email: "Karl.Marx@gmail.com",
    password: "123456"
)

Teddy = User.create!(
    username: "Teddy",
    first_name: "Theodor",
    last_name: "Adorno",
    email: "Theodor.Adorno@gmail.com",
    password: "123456"
)

Fritzi = User.create!(
    username: "Fritzi",
    first_name: "Friedrich",
    last_name: "Nietzsche",
    email: "Friedrich.Nietzsche@gmail.com",
    password: "123456"
)

puts "End seeding Users, #{User.count} created ..."



puts "Start seeding Kondos..."


  Kondo.create!(
    title: "My first Demo tape from 1995",
    description: "I originally recorded it when I was still a teenager and made it a Kondo so that you can have maximum joy of Rap vibes from the past!",
    picture:"https://images.unsplash.com/photo-1494232410401-ad00d5433cfa?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8dmludGFnZXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=600&q=60",
    location: "Hagelberger Str. 10-15, Friedrichshain-Kreuzberg, 10965 Berlin",
    user: Friddi,
    reserved: false,
    active: true
    )

  Kondo.create!(
    title: "My Grandma's Grammophone",
    description: "Although very good in shape, I am emotionally not capable of having it around me anymore, so please come by and fetch it ",
    picture:"https://images.unsplash.com/photo-1518893883800-45cd0954574b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
    location: "Kreuzbergstraße 17a, Friedrichshain-Kreuzberg, 10965 Berlin",
    user: Fritzi,
    reserved: false,
    active: true
    )

  Kondo.create!(
    title: "Vintage Pocket Watch",
    description: "Just found this very old and sadly not functional watch when tidying my stuff during lock-down, for s.o. to repair maybe? ",
    picture:"https://images.unsplash.com/photo-1509048191080-d2984bad6ae5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHZpbnRhZ2V8ZW58MHx8MHw%3D&auto=format&fit=crop&w=600&q=60",
    location: "Nostitzstraße 15, Friedrichshain-Kreuzberg, 10961 Berlin",
    user: Fritzi,
    reserved: false,
    active: true
    )

  Kondo.create!(
    title: "Some old maps-posters for you?",
    description: "Hidden in an old box I found these old maps of Berlin, I kept some for myself, feel free to stop by and get one!",
    picture:"https://images.unsplash.com/photo-1473163928189-364b2c4e1135?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDJ8fHZpbnRhZ2UlMjBib29rc3xlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=600&q=60",
    location: "141, Bergmannstraße, Friedrichshain-Kreuzberg, 10961 Berlin",
    user: Kalle,
    reserved: false,
    active: true
    )

#   Kondo.create!(
#     title: "",
#     description: "",
#     picture:"",
#     location: "",
#     user: ,
#     reserved: false,
#     active: true
#     )

puts "End seeding Kondos, #{Kondo.count} created ..."


berlin_districts = [ "Charlottenburg-Wilmersdorf", "Friedrichshain-Kreuzberg", "Lichtenberg", "Marzahn-Hellersdorf", "Mitte", "Neukölln", "Pankow", "Reinickendorf", "Spandau", "Steglitz-Zehlendorf", "Tempelhof-Schöneberg", "Treptow-Köpenick" ]


