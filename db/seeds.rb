require "open-uri"
require 'faker'
p "Destroying Tabels"
Game.destroy_all
User.destroy_all
Location.destroy_all
Sport.destroy_all
p "destroy Ok"

p "Creating Users"

file1 = URI.open("https://avatars.githubusercontent.com/u/74985628?v=4")
userAdmin = User.create!(name:"bididah",email:"hanfi@gmail.com" ,password:"123456",phone_number:"+212 6 61137987",age:27,bio:"I'am a person that loves Football",rating:5 ,admin: true)
userAdmin.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')


user1 = nil
names = ['hamza','Ahmed','Mohamed',"Zakaria","Omar","Boris","HakiMi","Protegaw","Bididah"]
9.times do  |i|
  p "Creating User #{names[i]}"
  file = URI.open("https://i.pravatar.cc/150?img=#{i+12}")
  user1 = User.create!(name:names[i],email:Faker::Internet.email ,password:"123456",phone_number:"+212 6 61137987", age:27, bio:"I'am a person that loves all sports !",rating:[3,4,4,4,5].sample)
  user1.photo.attach(io: file, filename: "nes#{i}.png", content_type: 'image/png')
end


p "Creating Sports"

football_image = URI.open("app/assets/images/paysage_foot.jpeg")
football = Sport.create!(name:"Football")
football.photo.attach(io: football_image, filename: 'f.png', content_type: 'image/png')
p "Football sport created ! "

tennis_image = URI.open("app/assets/images/paysage_tennis.jpeg")
tennis = Sport.create!(name:"Tennis")
tennis.photo.attach(io: tennis_image, filename: 't.png', content_type: 'image/png')
p "Tennis sport created ! "

basketball_image = URI.open("app/assets/images/paysage_basket.jpeg")
basketball = Sport.create!(name:"Basketball")
basketball.photo.attach(io: basketball_image, filename: 'b.png', content_type: 'image/png')
p "Basketball sport created ! "

eSport_image = URI.open("app/assets/images/paysage_esport.jpeg")
eSport = Sport.create!(name:"E-Sports")
eSport.photo.attach(io: eSport_image, filename: 'e.png', content_type: 'image/png')
p "E-sports sport created ! "


p "Creating Locations"
cityFoot = Location.create!(name:'City-Foot',address:'Route El Jadida Km 7',city:"Casablanca")
arsenal = Location.create!(name:'Arsenal',address:'Oasis',city:"Casablanca")
atlantique = Location.create!(name:'Atlantique',address:'El Hank',city:"Casablanca")
master = Location.create!(name:'Master 5',address:'Lissasfa apres rond point Azban',city:"Casablanca")
est = Location.create!(name:'Terrain EST',address:'Quartier Chaimae Sidi Maarouf',city:"Casablanca")
clubcoc = Location.create!(name:'Terrain COC',address:'Rond point MLY Boulvard Roudani',city:"Casablanca")
complexM5 = Location.create!(name:'Salle basket M5',address:'Maarif',city:"Casablanca")
p "Locations created ! "

p "Creating Game"
Game.create!(title:"Match 5x5",description:"nous sommes un groupe de 5 joueurs et nous cherchons 5 autres joueurs, le terrain est bel et bien reservé à cityFoot",date:DateTime.now,capacity:5,status:"still need player",location_id:cityFoot.id,sport_id: football.id,creator_id:userAdmin.id)
Game.create!(title:"Tournoi Tennis",description:"Le coc Club organise Un tournoi Tennis palces limite a 10 joueurs ",date:DateTime.now,capacity:10,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: User.first.id)
Game.create!(title:"Match football",description:"je cherche 2 joueur pour un march foot 7x7",date:DateTime.now,capacity:2,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:User.second.id)
Game.create!(title:"Partido Pelota",description:"il nous manque un joueur",date:DateTime.now,capacity:1,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:User.third.id)
Game.create!(title:"Tennis Simple",description:"je cherche un TennisMan pour pratiquer ",date:DateTime.now,capacity:1,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: User.fourth.id)
Game.create!(title:"Match basketball",description:"je cherche 3 joueurs pour un match ",date:DateTime.now,capacity:3,status:"still need player",location_id:complexM5.id,sport_id: basketball.id,creator_id:User.fourth.id)

p "Games created ! "
