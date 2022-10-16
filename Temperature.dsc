HC_biome_temp:
    type: world
    debug: false
    events:
        on system time secondly:
            - foreach <server.online_players>:
                - if <player[<[value]>].location.biome.temperature> < 0.6 and <player[<[value]>].location.material.name> == water and <player.gamemode> == survival:
                    - adjust <player[<[value]>]> freeze_duration:11
                    - actionbar <blue><yaml[<player.flag[language].if_null[en_us]>].read[generic.warn.freezing].if_null[<yaml[<player.flag[language].if_null[en_us]>].read[generic.null]>]> targets:<player[<[value]>]>