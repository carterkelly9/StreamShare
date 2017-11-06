# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(name: 'Bob', email: 'bob@sfu.ca', password: "bobpassword")
Admin.create(name: "Joey Bonzoe", email: "jbonzoe@sfu.ca", password: "joeypassword")

m = Medium.create(title: "song1")
u1.media << m;
