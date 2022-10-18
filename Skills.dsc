ItemCraftSkillEnforcement:
    type: world
    debug: false
    events:
        on player crafts item:
            - define skills <player.flag[Skills]>
            - define RequiredItemSkills <context.item.script.data_key[data].get[skills]>
            - if <context.item.script.is_truthy> and <[RequiredItemSkills].is_truthy>:
                - foreach <[RequiredItemSkills].exclude[Required]>:
                    - if <[value]> > <[Skills].get[<definition[key]>].get[lvl].if_null[0]>:
                        - narrate "<red>You Need <white><[value].sub[<[Skills].get[<definition[key]>].get[lvl].if_null[0]>]><red> more levels in <white><[key]><red> to craft this"
                        - determine cancelled