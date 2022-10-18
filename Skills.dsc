ItemCraftSkillEnforcement:
    type: world
    debug: false
    events:
        on player crafts item:
            - define skills <player.flag[Skills]>
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
                        - determine cancelled
                - foreach <[RequiredItemSkills].exclude[Required]>:
                    - if <[value]> > <[Skills].get[<definition[key]>].get[lvl].if_null[0]>:
                        - flag <player> Skill.<[key]>.xp:<player.flag[Skills.<[key].xp>].add[2]>
                        - narrate <player.flag[Skills.<[key].xp>]>


ItemSkillRequirements:
    type: data
    iron_shovel:
        Required: 1
        Crafting: 10