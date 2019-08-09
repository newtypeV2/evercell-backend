# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User seeds
gian = User.create!(username: "gian", password:"password")
rob = User.create!(username: "rob", password:"password")

#Character seeds
stasis = Character.find_or_create_by(name:"Stasis", max_hp:40, attack_damage:10, attack_range:1, user_id: gian.id, race: "human")
gneisenau = Character.find_or_create_by(name:"Gneisenau", max_hp:40, attack_damage:10, attack_range:1,user_id: gian.id, race: "lizard")

hazard = Character.find_or_create_by(name:"Hazard", max_hp: 40, attack_damage:10, attack_range:1, user_id: rob.id, race: "elf")

#Tile seeds
floor_1 = Tile.find_or_create_by(name: "floor_1", passover:true)
floor_2 = Tile.find_or_create_by(name: "floor_2", passover:true)
floor_3 = Tile.find_or_create_by(name: "floor_3", passover:true)
floor_4 = Tile.find_or_create_by(name: "floor_4", passover:true)
floor_5 = Tile.find_or_create_by(name: "floor_5", passover:true)
floor_6 = Tile.find_or_create_by(name: "floor_6", passover:true)
floor_7 = Tile.find_or_create_by(name: "floor_7", passover:true)
floor_8 = Tile.find_or_create_by(name: "floor_8", passover:true)

tile_wsml = Tile.find_or_create_by(name: "wall_side_mid_left", passover:false)
tile_wsmr = Tile.find_or_create_by(name: "wall_side_mid_right", passover:false)
tile_wstl = Tile.find_or_create_by(name: "wall_side_top_left", passover:false)
tile_wstr = Tile.find_or_create_by(name: "wall_side_top_right", passover:false)
tile_wtl = Tile.find_or_create_by(name: "wall_top_left", passover:false)
tile_wtm = Tile.find_or_create_by(name: "wall_top_mid", passover:false)
tile_wtr = Tile.find_or_create_by(name: "wall_top_right", passover:false)
tile_wm = Tile.find_or_create_by(name: "wall_mid", passover:false)


#Monster seeds
ogre = Monster.find_or_create_by(name: "ogre", max_hp:20, attack_damage:8, attack_range: 1)
masked_orc = Monster.find_or_create_by(name: "masked_orc", max_hp:5, attack_damage:4, attack_range: 1)
skel = Monster.find_or_create_by(name: "skeleton", max_hp:2, attack_damage:1, attack_range: 1)

#Map seeds
testzone = Map.find_or_create_by(name:"Test Area", x_map_size:10, y_map_size:10)
widetestzone = Map.find_or_create_by(name: "Ultra Wide Test Area", x_map_size: 48, y_map_size: 16)
playersTestZone = Map.find_or_create_by(name:"2 Player Sim", x_map_size:15, y_map_size:15)

x_cords=0
y_cords=0
while(x_cords<testzone.x_map_size) do
    puts "X: #{x_cords}"
    while(y_cords<testzone.y_map_size) do
        puts "Y: #{y_cords}" 
        MapTile.find_or_create_by(map_id: testzone.id, x_coordinate: x_cords, y_coordinate: y_cords, tile_id:(rand(1..8)))
        y_cords += 1
    end
    y_cords = 0
    x_cords += 1
end

x_cords=0
y_cords=0
while(x_cords<widetestzone.x_map_size) do
    puts "X: #{x_cords}"
    while(y_cords<widetestzone.y_map_size) do
        puts "Y: #{y_cords}" 
        MapTile.find_or_create_by(map_id: widetestzone.id, x_coordinate: x_cords, y_coordinate: y_cords, tile_id:(rand(1..8)))
        y_cords += 1
    end
    y_cords = 0
    x_cords += 1
end

x_cords=0
y_cords=0
while(x_cords<playersTestZone.x_map_size) do
    puts "X: #{x_cords}"
    while(y_cords<playersTestZone.y_map_size) do
        puts "Y: #{y_cords}" 
        MapTile.find_or_create_by(map_id: playersTestZone.id, x_coordinate: x_cords, y_coordinate: y_cords, tile_id:(rand(1..8)))
        y_cords += 1
    end
    y_cords = 0
    x_cords += 1
end

#Game seed
gametest = Game.find_or_create_by(map_id: testzone.id, description:"An Area where you can test stuff.", started: true)
widegametest = Game.find_or_create_by(map_id: widetestzone.id, description: "Ultrawide test area.", started: true)
playerstest = Game.find_or_create_by(map_id: playersTestZone.id, description:"2 Player Instance test.", started: true)

#Character Instance Seed
    #10x10-1Char-3Monsters
CharacterGame.find_or_create_by(character_id: stasis.id, game_id: gametest.id,x_coordinate:1, y_coordinate:1,hp: stasis.max_hp, max_hp: stasis.max_hp)
    #48x16-1Char-0Monsters
CharacterGame.find_or_create_by(character_id: gneisenau.id, game_id: widegametest.id,x_coordinate:1, y_coordinate:1,hp: gneisenau.max_hp, max_hp: gneisenau.max_hp)
    #20x20-2Char-4Monsters
CharacterGame.find_or_create_by(character_id: stasis.id, game_id: playerstest.id,x_coordinate:1, y_coordinate:1,hp: stasis.max_hp, max_hp: stasis.max_hp)
CharacterGame.find_or_create_by(character_id: hazard.id, game_id: playerstest.id,x_coordinate:2, y_coordinate:2,hp: hazard.max_hp, max_hp: hazard.max_hp)

#Monster Instance Seed
    #10x10-1Char-3Monsters
GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 9, y_coordinate: 0, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 0, y_coordinate: 9, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 9, y_coordinate: 9, hp:skel.max_hp, max_hp:skel.max_hp)
    #20x20-2Char-4Monsters
GameMonster.find_or_create_by(game_id: playerstest.id, monster_id: skel.id,x_coordinate: 5, y_coordinate: 14, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: playerstest.id, monster_id: masked_orc.id,x_coordinate: 14, y_coordinate: 14, hp:masked_orc.max_hp, max_hp:masked_orc.max_hp)
GameMonster.find_or_create_by(game_id: playerstest.id, monster_id: skel.id,x_coordinate: 9, y_coordinate: 13, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: playerstest.id, monster_id: masked_orc.id,x_coordinate: 12, y_coordinate: 14, hp:masked_orc.max_hp, max_hp:masked_orc.max_hp)
