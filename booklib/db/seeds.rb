# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create!(title: 'Маленькие женщины', author: 'admin')
Book.create!(title: 'Внутри убийцы', author: 'admin')
Book.create!(title: 'Безмолвный пациент', author: 'admin')
Book.create!(title: '1984', author: 'admin')
Book.create!(title: 'Зулейха открывает глаза', author: 'admin')
Book.create!(title: 'Гарри Поттер и философский камень', author: 'admin')
Book.create!(title: 'Цветы для Элджернона', author: 'admin')

Choice.create!(book_id: 1, id_user: 1, chosen: 1, read: 0)
Choice.create!(book_id: 2, id_user: 1, chosen: 0, read: 0)
Choice.create!(book_id: 3, id_user: 1, chosen: 0, read: 1)
Choice.create!(book_id: 4, id_user: 1, chosen: 0, read: 1)
Choice.create!(book_id: 5, id_user: 1, chosen: 1, read: 0)
Choice.create!(book_id: 6, id_user: 2, chosen: 1, read: 0)
Choice.create!(book_id: 7, id_user: 2, chosen: 0, read: 1)

User.create!(name: 'admin', pass: 12345)
User.create!(name: 'sys', pass: 12345)
