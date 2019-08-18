class CharacterGameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'character_game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def receive(data)
    if (!data["player"].nil?)
      playerInstance = CharacterGame.find(data["player"]["id"])
      playerInstance.update(x_coordinate:data["player"]["x_coordinate"] ,y_coordinate:data["player"]["y_coordinate"], direction: data["player"]["direction"], hp: data["player"]["hp"])
    elsif(!data["players"].nil?)
      data["players"].each do |player|
        playerInstance = CharacterGame.find(player["id"])
        playerInstance.update(x_coordinate:player["x_coordinate"] ,y_coordinate:player["y_coordinate"], direction: player["direction"], hp: player["hp"])
      end
    elsif (!data["respawn"].nil?)
      data["player"] = data.delete("respawn")
      game_map = Game.find(data["gameId"]).map
      data["player"]["x_coordinate"] = rand(0...game_map.x_map_size)
      data["player"]["y_coordinate"] = rand(0...game_map.y_map_size)
      data["player"]["hp"] = data["player"]["max_hp"]
    end
    # data["monsters"] = move_monster(data["game_id"])
    ActionCable.server.broadcast('character_game', data)
  end
  
end

  # def move_monster(game_id)
  #   x_move_value = [1,-1,0]
  #   y_move_value = [1,-1]
  #   game_map = Game.find(game_id).map
  #   game_players = CharacterGame.where(game_id: game_id)
  #   game_monsters = GameMonster.where(game_id: game_id)
  #   new_game_mons = game_monsters.select do |monster|
  #         monster.hp > 0
  #         end.map do |monster|
  #           xValue = x_move_value.sample
  #           yValue = y_move_value.sample

  #           if(xValue === 0)
  #             if(
  #               monster.y_coordinate + yValue >=0 && 
  #               monster.y_coordinate + yValue < game_map.y_map_size
  #               )
  #               monster.y_coordinate += yValue
  #             else
  #               monster.y_coordinate -= yValue
  #             end
  #           else
  #             if(
  #               monster.x_coordinate + xValue >=0 && 
  #               monster.x_coordinate + xValue < game_map.x_map_size
  #               )
  #               monster.x_coordinate += xValue
  #             else
  #               monster.x_coordinate -= xValue
  #             end
  #           end
            
  #           monster.update!(x_coordinate:monster.x_coordinate , y_coordinate:monster.y_coordinate)

  #           monsterobj = {
  #             id: monster.id,
  #             x_coordinate: monster.x_coordinate,
  #             y_coordinate: monster.y_coordinate
  #           }

  #         end


  #         return new_game_mons
  #   end

