# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  description :text             not null
#  sex         :string(1)
#  colors_options gray white ginger brown cream 


Cat.destroy_all 

cat_one = Cat.create!(birth_date: '05/10/1990', color: 'gray', name: 'Mack', description: 'A cat who likes to play!', sex: 'M')
cat_two = Cat.create!(birth_date: '05/10/1991', color: 'white', name: 'Chris', description: 'A cat who likes to play!', sex: 'M')
cat_three = Cat.create!(birth_date: '05/10/1992', color: 'ginger', name: 'Dessey', description: 'A cat who likes to play!', sex: 'F')
cat_four = Cat.create!(birth_date: '05/10/1993', color: 'brown', name: 'Nick', description: 'A cat who likes to play!', sex: 'M')
cat_five = Cat.create!(birth_date: '05/10/1994', color: 'cream', name: 'Flipper', description: 'A cat who likes to play!', sex: 'F')
cat_six = Cat.create!(birth_date: '05/10/1995', color: 'gray', name: 'Cain', description: 'A cat who likes to play!', sex: 'M')
cat_seven = Cat.create!(birth_date: '05/10/1996', color: 'white', name: 'Flappy', description: 'A cat who likes to play!', sex: 'F')


CatRentalRequest.create!(:cat_id => cat_one.id, :start_date => "2019/09/10", :end_date => "2019/09/20")
CatRentalRequest.create!(:cat_id => cat_one.id, :start_date => "2019/09/10", :end_date => "2019/09/25", status: 'APPROVED')
CatRentalRequest.create!(:cat_id => cat_three.id, :start_date => "2019/09/15", :end_date => "2019/09/19")
CatRentalRequest.create!(:cat_id => cat_one.id, :start_date => "2019/09/9", :end_date => "2019/09/18")
CatRentalRequest.create!(:cat_id => cat_two.id, :start_date => "2019/09/15", :end_date => "2019/09/17")