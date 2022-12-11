HC_barbarianhelm:
    type: item
    debug: false
    data:
        discover: false
    material: chainmail_helmet
    display name: <reset><&color[#BFA92B]>Barbarian Helm

barbarianhelm_script:
    type: world
    debug: false
    events:
        on player damages entity:
            - if <player.equipment.get[4].script.name.if_null[]> == HC_barbarianhelm:
                - if <context.final_damage> > <player.weapon_damage>:
                    - determine passively <context.final_damage.mul[1.05]>
                    - stop
                - determine passively <context.final_damage.mul[1.15]>

HC_barbarianlegwraps:
    type: item
    debug: false
    data:
        discover: false
    material: chainmail_boots
    display name: <reset><&color[#BFA92B]>Barbarian Leg Wraps

barbarianlegwraps_script:
    type: world
    debug: false
    events:
        on player damages entity:
            - if <player.equipment.get[1].script.name.if_null[]> == HC_barbarianlegwraps:
                - if <context.final_damage> > <player.weapon_damage>:
                    - determine passively <context.final_damage.mul[1.05]>
                    - stop
                - determine passively <context.final_damage.mul[1.15]>

HC_barbarianarmor:
    type: item
    debug: false
    data:
        discover: false
    material: chainmail_chestplate
    display name: <reset><&color[#BFA92B]>Barbarian Armor

barbarianarmor_script:
    type: world
    debug: false
    events:
        on player damages entity:
            - if <player.equipment.get[3].script.name.if_null[]> == HC_barbarianarmor:
                - if <context.final_damage> > <player.weapon_damage>:
                    - determine passively <context.final_damage.mul[1.05]>
                    - stop
                - determine passively <context.final_damage.mul[1.20]>
