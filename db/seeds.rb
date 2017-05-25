# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
                  name: 'Henrique',
                  email: 'henrique@example.com',
                  password: '12345'
              }, {
                  name: 'Joares',
                  email: 'henrique@example.com',
                  password: '12345'
              }])

locations = Location.create([
                    {name: 'Pensacola'},
                    {name: 'Jacksonville'}
                ])

Employee.create!([
                    {name: 'Henrique Zago', role: 0, birth_date: Date.new, ssn: '123456789', location: locations.first},
                    {name: 'Heloisy Zago', role: 1, birth_date: Date.new, ssn: '123456782', location: locations.last}
                ])