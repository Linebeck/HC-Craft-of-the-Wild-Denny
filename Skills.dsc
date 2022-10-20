ItemCraftSkillEnforcement:
    type: world
    debug: false
    events:
        on player crafts item:
            - define skills <player.flag[Skills].if_null[]>
            - define RequiredItemSkills <context.item.script.data_key[data].get[skills]>
            - if <context.item.script.is_truthy> and <[RequiredItemSkills].is_truthy> and <[RequiredItemSkills].get[Required]> == 1:
                - foreach <[RequiredItemSkills].exclude[Required]>:
                    - if <[value]> > <[Skills].get[<definition[key]>].get[lvl].if_null[0]>:
                        - narrate "<red>You Need <white><[value].sub[<[Skills].get[<definition[key]>].get[lvl].if_null[0]>]><red> more levels in <white><[key]><red> to craft this"
                        - determine cancelled
            - define RequiredItemSkills <script[ItemSkillRequirements].data_key[<context.item.material.name>].if_null[]>
            - if <script[ItemSkillRequirements].data_key[<context.item.material.name>].is_truthy> and <[RequiredItemSkills].get[Required]> == 1:
                - foreach <[RequiredItemSkills].exclude[Required]>:
                    - if <[value]> > <[Skills].get[<definition[key]>].get[lvl].if_null[0]>:
                        - narrate "<red>You Need <white><[value].sub[<[Skills].get[<definition[key]>].get[lvl].if_null[0]>]><red> more levels in <white><[key]><red> to craft this"
                        - determine passively cancelled
            - foreach <context.item.script.data_key[data].get[skills].exclude[Required].exclude[xp]>:
                - define ItemXpAward <context.item.script.data_key[data].get[skills].get[xp].if_null[2]>
                - if <[value]> > <[Skills].get[<definition[key]>].get[lvl].if_null[0]>:
                    - define xp <[Skills].get[<definition[key]>].get[xp].if_null[0]>
                    - flag <player> Skills.<definition[key]>.xp:+:<[ItemXpAward]>
                    - if <[xp]> >= <[Skills].get[<definition[key]>].get[lvl].if_null[0].mul[100]>:
                        - flag <player> Skills.<definition[key]>.lvl:+:1
                        - narrate "<white><[key]> <green>leveled up to <white><[Skills].get[<definition[key]>].get[lvl].if_null[1]>"


ItemSkillRequirements:
    type: data
    iron_shovel:
        Required: 0
        Crafting: 10