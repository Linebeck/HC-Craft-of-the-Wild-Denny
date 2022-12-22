CampfireHealing:
    type: world
    debug: false
    events:
            on system time secondly every:2:
            - foreach <server.online_players>:
                - define player <[value]>
                - define campfires <[player].location.find_blocks[campfire].within[6]>
                - define soul_campfires <[player].location.find_blocks[soul_campfire].within[6]>
                - if !<[campfires].is_empty>:
                    - foreach <[campfires]>:
                        - if <[value].switched>:
                            - cast regeneration amplifier:0 duration:10s <[player]> hide_particles
                - if !<[soul_campfires].is_empty>:
                    - foreach <[soul_campfires]>:
                        - if <[value].switched>:
                            - cast night_vision amplifier:0 duration:8s <[player]> hide_particles
                            - cast fire_resistance amplifier:0 duration:20s <[player]> hide_particles

UnlitCampfires:
    type: world
    debug: false
    events:
        on player places campfire|soul_campfire:
            - if <player.gamemode> != creative:
                - switch <context.location>
