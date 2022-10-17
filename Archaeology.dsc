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
                    - playeffect effect:block_crack quantity:50 offset:0.3 at:<context.location.center> special_data:<[block]>
                    - playsound <context.location> sound:block_grass_step volume:.80 pitch:0.60
                    - wait 1t
                    - if <util.random_chance[<player.item_in_hand.flag[BrushPercentage]>]>:
                        - if <util.random_chance[0.01]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.legendary].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[1]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.ultrarare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[5]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.veryrare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[15]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.rare].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[30]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.uncommon].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[100]>:
                            - drop <context.location> <script[archaeology_data].data_key[<[block]>.common].random.if_null[air]> speed:0
                            - stop

archaeology_data:
    type: data
    dirt:
        color:
        - #834510
        common:
        - clay_ball
        - wheat_seeds
        uncommon:
        - bone
        rare:
        - pumpkin_seeds
    gravel:
        color: #CCCCCC
        common:
        - clay
        - bone
        - wheat_seeds
        uncommon:
        - flint
        - coal
        rare:
        - iron_nugget
    sand:
        color: #FEFB92
        common:
        - bone
        uncommon:
        - melon_seeds
        rare:
        - iron_nugget
        veryrare:
        - gold_nugget
        ultrarare:
        - skeleton_skull
    soul_sand:
        color: #5D350B
        common:
        - bone
        uncommon:
        - flint
        - gold_nugget
        rare:
        - nether_wart
        - magma_cream
        - ghast_tear
        very rare:
        - wither_rose
        ultrarare:
        - wither_skeleton_skull
        legendary:
        - ancient_debris
