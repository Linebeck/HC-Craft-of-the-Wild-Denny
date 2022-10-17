archaeologybrush_script:
    type: world
    debug: false
    events:
        on player right clicks block with:HC_Archaeology_Brush:
            - ratelimit <player> 2t
            - define block <context.location.material.name>
            - define BP <context.location.block.flag[BrushedProgress].if_null[0]>
            - if <script[archaeology_data].data_key[<[block]>].exists>:
                - flag <context.location.block> BrushedProgress:<[BP].add[1]> expire:1d
                - playeffect effect:red_dust special_data:1|<&color[#CCCCCC]> at:<context.location.center> offset:0.4 quantity:4
                - if <[BP]> >= 4:
                    - modifyblock <context.location> air
                    - playeffect effect:block_crack quantity:40 offset:0.3 at:<context.location.center> special_data:<[block]>
                    - playsound <context.location> sound:block_grass_step volume:.80 pitch:0.60
                    - wait 1t
                    - if <util.random_chance[<player.item_in_hand.flag[BrushPercentage]>]>:
                        - if <util.random_chance[0.05]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.legendary].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[5]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.ultrarare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[10]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.veryrare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[20]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.rare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[40]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.uncommon].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[100]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.common].random.if_null[air]> speed:0
                            - stop

archaeology_data:
    type: data
    dirt:
        common:
        - clay_ball
        - wheat_seeds
        - sugarcane
        - beetroot seed
        
        uncommon:
        - bone
        rare:
        - pumpkin_seeds
        veryrare:
        - potato
        - hc_fossil
        ultrarare:
        - gunpowder
        legendary:
        - creeper_spawn_egg
        - pig_spawn_egg
    gravel:
        common:
        - clay_ball
        - bone
        - wheat_seeds
        - flint
        uncommon:
        - string
        - coal
        rare:
        - iron_nugget
        - hc_fossil
        veryrare:
        - raw_iron
        - experience_bottle
        
        ultrarare:
        - emerald
        legendary:
        - silverfish_spawn_egg
        - spider_spawn_egg
    sand:
        common:
        - bone
        - cactus
        - hc_fossil
        uncommon:
        - melon_seeds
        - scute
        - dried_kelp
        rare:
        - iron_nugget
        - nautilus
        veryrare:
        - gold_nugget
        ultrarare:
        - diamond
        - skeleton_skull
        legendary:
        - turtle_egg

    soul_sand:
        common:
        - bone
        - flint
        - gold_nugget
        uncommon:
        - soul_lantern
        - hc_fossil
        rare:
        - nether_wart
        - magma_cream
        - ghast_tear
        - gold_ingot
        very rare:
        - wither_rose
        - golden_sword
        ultrarare:
        - wither_skeleton_skull
        legendary:
        - netherite_scrap
        - piglin_spawn_egg