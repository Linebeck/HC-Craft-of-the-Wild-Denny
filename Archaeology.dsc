archaeologybrush_script:
    type: world
    debug: false
    events:
        on player right clicks block with:HC_Archaeology_Brush*:
            - ratelimit <player> 2t
            - define blocklocation <context.location>
            - define blockname <context.location.material.name>
            - define BP <context.location.block.flag[BrushedProgress].if_null[0]>
            - define BrushPercentageMod <player.item_in_hand.flag[BrushPercentageMod].if_null[1]>]
            - if <script[archaeology_data].data_key[<[blockname]>].exists>:
                - flag <context.location.block> BrushedProgress:<[BP].add[1]> expire:1d
                - playeffect effect:red_dust special_data:1|<&color[#CCCCCC]> at:<context.location.center> offset:0.4 quantity:4
                - if <[BP]> >= 4:
                    - flag <context.location.block> BrushedProgress:!
                    - modifyblock <context.location> air
                    - playeffect effect:block_crack quantity:40 offset:0.3 at:<context.location.center> special_data:<[blockname]>
                    - playsound <context.location> sound:block_grass_step volume:.80 pitch:0.60
                    - wait 1t
                    - if <util.random_chance[<player.item_in_hand.flag[BrushPercentage]>]>:
                        - if <util.random_chance[0.05].mul[<[BrushPercentageMod]>]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.legendary].random.if_null[air]> speed:0
                            - playeffect effect:redstone at:<context.location.center> quantity:10 special_data:1|<&color[#324ab2]> offset:0.3
                            - stop
                        - if <util.random_chance[2.5].mul[<[BrushPercentageMod]>]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.ultrarare].random.if_null[air]> speed:0
                            - playeffect effect:redstone at:<context.location.center> quantity:10 special_data:1|<&color[#CE389C]> offset:0.3
                            - stop
                        - if <util.random_chance[7].mul[<[BrushPercentageMod]>]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.veryrare].random.if_null[air]> speed:0
                            - playeffect effect:redstone at:<context.location.center> quantity:10 special_data:1|<&color[#FFC000]> offset:0.3
                            - stop
                        - if <util.random_chance[20].mul[<[BrushPercentageMod]>]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.rare].random.if_null[air]> speed:0
                            - playeffect effect:redstone at:<context.location.center> quantity:10 special_data:1|<&color[#FFC000]> offset:0.3
                            - stop
                        - if <util.random_chance[40].mul[<[BrushPercentageMod]>]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.uncommon].random.if_null[air]> speed:0
                            - stop
                        - if <util.random_chance[100]>:
                            - drop <context.location.center> <script[archaeology_data].data_key[<[blockname]>.common].random.if_null[air]> speed:0
                            - stop

archaeology_data:
    type: data
    dirt:
        common:
        - clay_ball
        - wheat_seeds
        - sugar_cane
        - beetroot_seeds
        uncommon:
        - bone
        rare:
        - pumpkin_seeds
        veryrare:
        - potato
        - hc_fossil
        - HC_Geode
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
        - HC_Geode
        ultrarare:
        - emerald
        - clock
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
        - spyglass
        - HC_Geode
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
        - HC_Geode
        ultrarare:
        - wither_skeleton_skull
        legendary:
        - netherite_scrap
        - piglin_spawn_egg

HC_Geode_script:
    type: world
    debug: false
    events:
        on player breaks stone:
            - if <util.random_chance[1]>:
                - determine HC_Geode
            - else:
                - stop
        on player breaks tuff:
            - if <util.random_chance[20]>:
                - determine HC_Geode
            - else:
                - stop
        on player breaks deepslate:
            - if <util.random_chance[.5]>:
                - determine HC_Geode
            - else:
                - stop
        on player breaks basalt:
            - if <util.random_chance[1]>:
                - determine HC_Geode
            - else:
                - stop
        on player right clicks block with:HC_Geode:
            - ratelimit <player> 2t
            - experience give 2
            - playsound at:<player.location> BLOCK_POINTED_DRIPSTONE_LAND pitch:1.5
            - take item:HC_Geode quantity:1
            - wait 1t
            - if <util.random_chance[.1]>:
                - give <script[geode_data].data_key[legendary].random.if_null[air]>
                - stop
            - if <util.random_chance[2.5]>:
                - give <script[geode_data].data_key[ultrarare].random.if_null[air]>
                - stop
            - if <util.random_chance[15]>:
                - give <script[geode_data].data_key[veryrare].random.if_null[air]>
                - stop
            - if <util.random_chance[30]>:
                - give <script[geode_data].data_key[rare].random.if_null[air]>
                - stop
            - if <util.random_chance[40]>:
                - give <script[geode_data].data_key[uncommon].random.if_null[air]>
                - stop
            - if <util.random_chance[100]>:
                - give <script[geode_data].data_key[common].random.if_null[air]>
                - stop
geode_data:
    type: data
    common:
    - flint
    - null
    - coal
    uncommon:
    - amethyst_shard
    - HC_Fossil
    - raw_copper
    rare:
    - name_tag
    - iron_nugget
    - gold_nugget
    veryrare:
    - raw_iron
    - raw_gold
    - HC_Diamond_Shard
    ultrarare:
    - diamond
    - experience_bottle
    - bucket
    legendary:
    - netherite_scrap
    - raw_iron_block
    - raw_gold_block
    - nether_star