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
user1 = User.create!(name:"hamza",email:"hanfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:3.5)
user2 =User.create!(name:"Ahmed", email:"han@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Sports",rating:4.5)
user3 =User.create!(name:"Mohamed", email:"h@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I think messi will win the WC in Qatar",rating:2.5)
user4 =User.create!(name:"Zakaria", email:"hani@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jeu Set et Match Nadal",rating:3)
user5 =User.create!(name:"Omar", email:"amz@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user6 =User.create!(name:"Boris", email:"nfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jib chi 6 s7a7a o ntla9aw f Tiran",rating:4)
user7 =User.create!(name:"HakiMi", email:"hanmzafi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:3.5)
user8 =User.create!(name:"Protegaw", email:"hanfbididai@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Sports",rating:4.5)
user9 =User.create!(name:"Bididah", email:"hanrajai@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I think messi will win the WC in Qatar",rating:2.5)
user10 =User.create!(name:"His Majesty DIEGO ARMANDO MARADONA", email:"hantbaei@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jeu Set et Match Nadal",rating:5)
user11 =User.create!(name:"Diego Forlan", email:"hassi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user12 =User.create!(name:"Yasine", email:"hansdrei@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user13 =User.create!(name:"Ibra", email:"haseefi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Football",rating:3.5)
user14 =User.create!(name:"Evra", email:"hansdefi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I'am a person that loves Sports",rating:4.5)
user15 =User.create!(name:"Pogba", email:"hancsfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"I think messi will win the WC in Qatar",rating:2.5)
user16 =User.create!(name:"KONTE", email:"hasdrwenfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Jeu Set et Match Nadal",rating:3)
user18 =User.create!(name:"7liwa", email:"hasewnfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user18 =User.create!(name:"Elgrande ToTo", email:"hansdwfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user19 =User.create!(name:"Hafid", email:"handerrfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)
user20 =User.create!(name:"Ossama", email:"handwfi@gmail.com",password:"123456",phone_number:"0661137987",age:27,bio:"Rest in Peace Coby ",rating:4)

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
Game.create!(title:"Match 5x5",description:"nous somme un group de 5 joueur et nous cherchons 5 autres jouer, le terrain est bel et reserver a cityFoot",date:DateTime.now,capacity:5,status:"still need player",location_id:cityFoot.id,sport_id: football.id,creator_id:user1.id)
Game.create!(title:"Tournoi Tenis",description:"Le coc Club organize Un tournoi Tenis palces limite a 10 joueurs ",date:DateTime.now,capacity:10,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: user4.id)
Game.create!(title:"Match football",description:"je cherche 2 joueur pour un march foot 7x7",date:DateTime.now,capacity:2,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:user3.id)
Game.create!(title:"Partido Pelota",description:"il nous manque un joueur",date:DateTime.now,capacity:1,status:"still need player",location_id:arsenal.id,sport_id: football.id,creator_id:user13.id)
Game.create!(title:"Tennis Simple",description:"je cherche un TennisMan pour pratiquer ",date:DateTime.now,capacity:1,status:"still need player",location_id: clubcoc.id,sport_id: tennis.id,creator_id: user14.id)
Game.create!(title:"Match basketball",description:"je cherche 3 joueurs pour un match ",date:DateTime.now,capacity:3,status:"still need player",location_id:complexM5.id,sport_id: basketball.id,creator_id:user8.id)



# a Booking have
#---player_id
#---game_id
#---status
#No need to create seeds for booking we should real bookings ones the implementation of all the models is DONE
