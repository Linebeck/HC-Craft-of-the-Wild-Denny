HC_ItemMagnet:
    type: item
    debug: false
    data:
        discover: false
    material: iron_ingot
    display name: <reset><gray>Item <red>Magnet
    mechanisms:
        hides: enchants


ItemMagnet_script:
    type: world
    debug: false
    events:
        on system time secondly every:4:
            - foreach <server.online_players> as:player:
                - if <[player].inventory.contains_item[HC_ItemMagnet]>:
                    - foreach <[player].location.find_entities.within[8]> as:item:
                        - if <[item].entity_type> == dropped_item:
                            - push <[item]> origin:<[item].location> destination:<[player].location.simple>
