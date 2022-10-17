ItemCraftSkillEnforcement:
    type: world
    debug: false
    events:
        on player crafts item:
            - define skills <player.flag[Skills]>
            - define RequiredItemSkills <context.item.script.data_key[data].get[skills]>
            - if <context.item.script.is_truthy> and <[RequiredItemSkills].is_truthy>:
                - narrate <[RequiredItemSkills]>
                - foreach <[RequiredItemSkills].exclude[Required]>:
                    - if <[value]> < <[Skills].get[<definition[key].get[1]>].if_null[]>:
                        - narrate fail
                - determine cancelled