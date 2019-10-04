cole = Watcher.create(name: "Cole", fav: "Crow", age: "27", catchphrase: "Errup-Jah waktik neh kob dah.")
admin = Watcher.create(name: "Admin", fav: "Eagle", age: "27", catchphrase: "Please dont drop my tables.")
garrett = Watcher.create(name: "Garrett", fav: "Chicken", age: "18", catchphrase: "Ok, so basically... Please name your variables better!")
daniel = Watcher.create(name: "Daniel P.", fav: "Street Pidgeon", age: "23", catchphrase: "Sometimes nobody shows up and you automatically win.")
andy = Watcher.create(name: "Andy", fav: "Cardinal", age: "28", catchphrase: "The summit is only halfway.")
sergio = Watcher.create(name: "Sergio", fav: "Hummingbird", age: "30", catchphrase: "Woodpeckers are annoying")
darkcole = Watcher.create(name: "Coyle", fav: "Crow", age: "27", catchphrase: "Errup-Jah waktik neh kob dah.".reverse)
crow = Bird.create(commonname: "Crow", diet: "edibles (no rice)", sciname: "Corvus corvus", color: "#000000")
chicken = Bird.create(commonname: "Chicken", diet: "Rice", sciname: "Gallus domesticus", color: "#FFFFFF")
jaybird = Bird.create(commonname: "Jaybird", diet: "Fried #{chicken.commonname}", sciname: "Dumbass feelsright", color: "#5555ff") 
duck = Bird.create(commonname: "Duck", diet: "algae", sciname: "Quercus quercus", color: "#00ff00") 
flamingo = Bird.create(commonname: "Flamingo", diet: "brineshrimp", sciname: "Flamingacae hydronae", color: "#ffaaaa") 
parrot = Bird.create(commonname: "Parrot", diet: "crackers", sciname: "Pollybiscidae wansonium", color: "#ff1111") 
canary = Bird.create(commonname: "Canary", diet: "seeds", sciname: "Coalminium metraconim", color: "#ffff00") 
kiwi = Bird.create(commonname: "Kiwi", diet: "bugs", sciname: "Actinidia arugata", color: "#006600") 
woodpecker = Bird.create(commonname: "Woodpecker", diet: "algae", sciname: "Quercus peckus", color: "#00ff00") 
penguin = Bird.create(commonname: "Penguin", diet: "fish", sciname: "Penguinium penguinus", color: "#000000") 







peacock = Bird.create(commonname: "Peacock", diet: "Bugs", sciname: "Pavo cristatus", color: ("#" + rand(16).to_s(16).upcase +  rand(16).to_s(16).upcase +  rand(16).to_s(16).upcase+  rand(16).to_s(16).upcase +  rand(16).to_s(16).upcase +  rand(16).to_s(16).upcase))
# binding.pry



name = Watcher.find_by(name: cole.name)
id = name.id

name = Bird.find_by(sciname: crow.sciname)
cid = name.id

cole.add_bird(cole, crow)
cole.add_bird(cole, chicken)
cole.add_bird(cole, peacock)
cole.add_bird(garrett, crow)
cole.add_bird(daniel, chicken)
cole.add_bird(andy, crow)
#Journalentry.create(watcher_id: id, bird_id: cid)
