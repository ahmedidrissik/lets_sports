require "open-uri"
require 'faker'
p "Destroying Tabels"
User.destroy_all
Game.destroy_all
Location.destroy_all
Sport.destroy_all
p "destroy Ok"
# a User have :
#---name
#---email
#---password
#---phone_number
#---"age"
#---"bio"
#---rating
p "Creating User"

file1 = URI.open("https://avatars.githubusercontent.com/u/74985628?v=4")
userAdmin = User.create!(name:"bididah",email:"hanfi@gmail.com" ,password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:[1,2,3,4,5].sample,admin: true)
userAdmin.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')


user1 = nil
names = ['hamza','Ahmed','Mohamed',"Zakaria","Omar","Boris","HakiMi","Protegaw","Bididah"]
9.times do  |i|
  file = URI.open(Faker::Avatar.image)
  user1 = User.create!(name:names[i],email:Faker::Internet.email ,password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:[1,2,3,4,5].sample)
  user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end




# user10 =User.create!(name:"His Majesty DIEGO ARMANDO MARADONA", email:"hantbaei@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jeu Set et Match Nadal",rating:3)
# user11 =User.create!(name:"Diego Forlan", email:"hassi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
# user12 =User.create!(name:"Yasine", email:"hansdrei@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
# user13 =User.create!(name:"Ibra", email:"haseefi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:3.5)
# user14 =User.create!(name:"Evra", email:"hansdefi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Sports",rating:4.5)
# user15 =User.create!(name:"Pogba", email:"hancsfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I think messi will win the WC in Qatar",rating:2.5)
# user16 =User.create!(name:"KONTE", email:"hasdrwenfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jeu Set et Match Nadal",rating:3)
# user18 =User.create!(name:"7liwa", email:"hasewnfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
# user18 =User.create!(name:"Elgrande ToTo", email:"hansdwfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
# user19 =User.create!(name:"Hafid", email:"handerrfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
# user20 =User.create!(name:"Ossama", email:"handwfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)




# a Sport have :
#---name
p "Creating Sport"
football = Sport.create!(name:"Football")
tennis = Sport.create!(name:"Tennis")
basketball = Sport.create!(name:"Basketball")
eSport = Sport.create!(name:"E-Sports")


# a Location have
#---name
#---addresse
#---city
p "Creating Location"
cityFoot = Location.create!(name:'City-Foot',address:'Route El Jadida Km 7',city:"Casablanca")
arsenal = Location.create!(name:'Arsenal',address:'Oasis',city:"Casablanca")
atlantique = Location.create!(name:'Atlantique',address:'El Hank',city:"Casablanca")
master = Location.create!(name:'Master 5',address:'Lissasfa apres rond point Azban',city:"Casablanca")
est = Location.create!(name:'Terrain EST',address:'Quartier Chaimae Sidi Maarouf',city:"Casablanca")
clubcoc = Location.create!(name:'Terrain COC',address:'Rond point MLY Boulvard Roudani',city:"Casablanca")
complexM5 = Location.create!(name:'Salle basket M5',address:'Maarif',city:"Casablanca")

# a game have
#---description
#---date
#---capatity
#---status
#---sport-id
#---location-id
#---Title
p "Creating Game"

Game.create!(title:"Match 5x5",description:"nous sommes un groupe de 5 joueurs et nous cherchons 5 autres joueurs, le terrain est bel et bien reservé à cityFoot",date:DateTime.now,capacity:5,status:"still need player",location_id:cityFoot.id,sport_id: football.id,creator_id:userAdmin.id)
Game.create!(title:"Tournoi Tennis",description:"Le coc Club organise Un tournoi Tennis palces limite a 10 joueurs ",date:DateTime.now,capacity:10,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: user1.id)
Game.create!(title:"Match football",description:"je cherche 2 joueur pour un march foot 7x7",date:DateTime.now,capacity:2,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:user1.id)
Game.create!(title:"Partido Pelota",description:"il nous manque un joueur",date:DateTime.now,capacity:1,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:user1.id)
Game.create!(title:"Tennis Simple",description:"je cherche un TennisMan pour pratiquer ",date:DateTime.now,capacity:1,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: user1.id)
Game.create!(title:"Match basketball",description:"je cherche 3 joueurs pour un match ",date:DateTime.now,capacity:3,status:"still need player",location_id:complexM5.id,sport_id: basketball.id,creator_id:user1.id)




# a Booking have
#---player_id
#---game_id
#---status
#No need to create seeds for booking we should real bookings ones the implementation of all the models is DONE
