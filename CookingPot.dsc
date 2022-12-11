HC_cooking_pot_menu:
    type: inventory
    inventory: chest
    title: ____      Cooking Pot
    gui: false
    slots:
        - [HC_menu_cooking_pot_UI] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray]
        - [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [] [] [] [] [] [HC_menu_gray]
        - [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_gray] [HC_menu_cooking_pot_confirm]

HC_cooking_pot_script:
    type: world
    debug: false
    events:
        on player breaks campfire:
            - if <context.location.block.campfire_items.contains_all_text[HC_menu_cooking_pot_model]>:
                - determine HC_cooking_pot|charcoal[quantity=<util.random.decimal[1].to[3]>]
        on campfire cooks item into item:
            - if <context.location.block.campfire_items.contains_all_text[HC_menu_cooking_pot_model]>:
                - determine cancelled
        on player places campfire:
            - if <player.item_in_hand.script.name.if_null[<player.item_in_hand.material.name>]> == HC_cooking_pot_demo:
                - flag <context.location.block> cooking_pot
        on player right clicks campfire:
            - if <player.item_in_hand.script.name.if_null[null]> == HC_cooking_pot:
                - adjust <context.location> campfire_items:HC_menu_cooking_pot_model
                - if <player.gamemode> != creative:
                    - take iteminhand quantity:1
                - stop
            - if <context.location.block.campfire_items.contains_all_text[HC_menu_cooking_pot_model]> and <context.location.switched> and !<player.is_sneaking>:
                - determine passively cancelled
                - inventory open d:HC_cooking_pot_menu
                - flag <player> openmenulocation:<context.location>
        on player clicks item in HC_cooking_pot_menu:
            - if <context.is_shift_click> or <context.item.has_flag[DisabledSlot]>:
                - determine cancelled
        on player clicks item in HC_cooking_pot_menu slot:12|13|14|15|16|17:
            - if <context.item.material.name> == air:
                - if <context.click> == right:
                    - stop
                - if <context.cursor_item.quantity> <= 1:
                    - stop
                - else:
                    - determine passively cancelled
                - stop
            - else:
                - if  <player.item_on_cursor.material.name> != air:
                    - determine cancelled
        on player clicks HC_menu_cooking_pot_confirm in HC_cooking_pot_menu:
            - foreach <player.open_inventory.list_contents.strip_color>:
                - if <[value].script.name.contains_text[HC_menu_]> != true and <[value].material.name> != air:
                    - if <[value].quantity> > 1:
                        - stop
                    - define list:->:<[value].script.name.if_null[<[value].material.name>]>
            - if <[list].if_null[null]> != null:
                - run HC_cooking_pot_script_cooking_logic def.list:<[list]> def.location:<player.flag[openmenulocation].as[location].above[1]> def.type:menu
        on player clicks HC_menu_* in HC_cooking_pot_menu:
            - determine cancelled

            

HC_cooking_pot_script_cooking_logic:
    type: task
    debug: false
    definitions: list|location|type
    script:
            - if <script[HC_cooking_masterlist].data_key[<[list]>].exists>:
                - if <[type]> == menu:
                    - inventory close
                - playsound custom sound:hyrulecore.music.effects.botw_cooking_success <player.location>
                - wait 5s
                - playeffect effect:ELECTRIC_SPARK at:<[location]> visibility:10 quantity:100
                - drop <script[HC_cooking_masterlist].data_key[<[list]>].after[@].as[list]> <[location]>
            - else:
                - if <[list].if_null[NULL]> == NULL:
                    - stop
                - else:
                    - if <[type]> == menu:
                        - inventory close
                    - playsound custom sound:hyrulecore.music.effects.botw_cooking_fail <player.location>
                    - wait 5s
                    - playeffect effect:smoke_large at:<[location]> visibility:10 quantity:10
            - if <[type]> == menu:
                - inventory close
                - if <player.has_flag[openmenulocation]>
                - flag <player> openmenulocation:!


HC_cooking_masterlist:
    type: data
    li@apple|:
    - HC_slightly_baked_apple
    li@beef|:
    - HC_Seared_Steak