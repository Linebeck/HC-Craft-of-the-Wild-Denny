HC_TravelMedallion:
    type: item
    debug: false
    data:
        discover: false
    material: diamond
    display name: <reset><blue>Travel Medallion
    mechanisms:
        custom_model_data: 50000
        lore:
        - <reset><dark_purple>Sneak and right click to place, right click again to travel!
HC_TravelMedallion_Script:
    type: world
    debug: false
    events:
        on player right clicks block with:HC_TravelMedallion:
            - ratelimit <player> 1t
            - if <player.is_sneaking> and !<player.item_in_hand.has_flag[medallionlocation]>:
                - inventory flag slot:hand medallionlocation:<context.location.above[1]>
                - stop
            - if <player.item_in_hand.has_flag[medallionlocation]> and !<player.is_sneaking>:
                - ratelimit <player> 300s
                - if <player.item_in_hand.flag[medallionlocation].is_spawnable>:
                    - teleport <player> <player.item_in_hand.flag[medallionlocation]>
                - else:
                    - narrate "<red>The destination is not safe!"