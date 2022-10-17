HC_biome_temp:
    type: world
    debug: false
    events:
        on player right clicks block with:carrot_on_a_stick:
            - determine passively cancelled
        on system time secondly:
            - foreach <server.online_players>:
                - define player <[value]>
                - define temp <[player].location.biome.temperature>
                - if <[player].location.material.name> == water:
                    - define temp <definition[temp].sub[0.8]>
                - foreach <[player].equipment>:
                    - if <[value].material.name> != air:
                        - define TempMod <[value].flag[TempMod].if_null[0.05]>
                        - define temp <definition[temp].add[<[TempMod]>]>
                - if <definition[temp]> < -0.7:
                    - adjust <[player]> freeze_duration:11
                    - define TempFriendly <&color[#ADD8E6]>Freezing
                - if <definition[temp]> >= 25:
                    - burn <[player]> duration:4s
                    - define TempFriendly <&color[#e50000]>Burning


                - if <[player].has_flag[DebugTemperature]>:
                    - ratelimit <[player]> 2s
                    - narrate "Biome temp: <[player].location.biome.temperature> Calulated temp: <[temp]> <definition[TempFriendly].if_null[Normal]>" targets:<[player]>


