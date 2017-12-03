# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(name: 'Bob', email: 'bob@sfu.ca', password: "bobpassword")
a1 = Admin.create(name: "Joey Bonzoe", email: "jbonzoe@sfu.ca", password: "joeypassword")

m = Song.create(title: "Midnight Rain", user_id: a1.id, filename:Pathname.new("test/upload_files/Turbo Knight - Midnight rain.mp3").open)

Share.create(owner_id: a1.id, guest_id: u1.id, medium_id: m.id)
