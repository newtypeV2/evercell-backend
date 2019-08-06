# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


gian = User.create!(username: "gian", password:"password")

stasis = Character.find_or_create_by(name:"Stasis", max_hp:40, attack_damage:10, attack_range:1,user_id: gian.id)

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

big_orc = Monster.find_or_create_by(name: "Big Orc", max_hp:20, attack_damage:8)
masked_orc = Monster.find_or_create_by(name: "Masked Orc", max_hp:5, attack_damage:4)
skel = Monster.find_or_create_by(name: "Skeleton", max_hp:2, attack_damage:1)

testzone = Map.find_or_create_by(name:"Test Area", x_map_size:10, y_map_size:10)

x_cords=0
y_cords=0
while(x_cords<10) do
    puts "X: #{x_cords}"
    while(y_cords<10) do
        puts "Y: #{y_cords}" 
        MapTile.find_or_create_by(map_id: testzone.id, x_coordinate: x_cords, y_coordinate: y_cords, tile_id:(rand(1..8)))
        y_cords += 1
    end
    y_cords = 0
    x_cords += 1
end

gametest = Game.find_or_create_by(map_id: testzone.id, description:"An Area where you can test stuff.", started: true)

CharacterGame.find_or_create_by(character_id: stasis.id, game_id: gametest.id,x_coordinate:1, y_coordinate:1,hp: stasis.max_hp, max_hp: stasis.max_hp)

GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 10, y_coordinate: 0, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 0, y_coordinate: 10, hp:skel.max_hp, max_hp:skel.max_hp)
GameMonster.find_or_create_by(game_id: gametest.id, monster_id: skel.id,x_coordinate: 10, y_coordinate: 10, hp:skel.max_hp, max_hp:skel.max_hp)
