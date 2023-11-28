# Planning

The game will be progressive, so it gets harder as you move on. Levels will be selected on a map of some sort, where playing certain levels unlocks others.

# Saving Data

Do we want to save progress of a player? We need to save high scores, so we could also just save progress too. The best way to save this data is going to be in JSON, raw in a file. Using java.io, R/W the file, then parse JSON. OR, save a directory of files, each representing one player, and find them all. Read them all into memory. Either solution shouldn't be too tough to implement, and depending upon what we want to save, one file will be enough.

# Graphics

Some graphics shouldn't be too hard to get ahold of. For others, we may need to modify or even create some art, using either Photoshop or GIMP.

# Objects

Most everything in the game will be represented by a GameObject object, which is abstract and provides the #update() and #render() methods.

Levels will be modeled as objects, and their status will be updated as the player unlocks them. They will also take control of the logic during their play. They should invoke the Map object when they are finished, conveying what should change on the Map.

Map will be a singleton; only one will be instantiated (unless we want multiple worlds or something like that, which I'm personally against). It will keep track of the progress of the player through the "world." There should be choice in the Map, that is, players can choose paths. 

# Achievements

If we want, we can create some. These would likely be modeled by a larger Achievement class which each achivement inherits from. The player will have an ArrayList<Achivement> which will keep track of them. They can have a name, description, etc.