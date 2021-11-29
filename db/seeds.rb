# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roleUser = Role.create({ name: 'Regular', description: 'Can see adds' })
roleAdmin = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })
roleManager = Role.create({ name: 'Registered',
                            description: 'Can read and create items. Can update and destroy own items' })

userAdmin = User.create({ username: 'Admin', email: 'admin@example.com', password: 'password',
                          password_confirmation: 'password', role_id: roleAdmin.id })

add1 = Add.create({ title: 'Rayban Sunglasses', body: 'Stylish shades', img: 's', user_id: userAdmin.id })

