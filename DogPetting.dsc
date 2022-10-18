petting_dogs:
    type: world
    debug: false
    events:
        on player right clicks wolf|cat with:air:
            - if <context.entity.is_tamed> and <player.is_sneaking> :
                 - determine passively cancelled
                 - Playeffect effect:heart at:<context.entity.location>
                 - playsound <context.location> sound:entity_wolf_pant volume:1 pitch:.90
                 - cast regeneration duration:15 <context.entity> hide_particles
                 - ratelimit <player> 5m
            - else:
                - stop
