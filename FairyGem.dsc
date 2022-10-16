HC_FairyGem:
    type: item
    debug: false
    data:
        discover: false
    material: amethyst_shard
    display name: <reset><light_purple>Fairy Gem
    mechanisms:
        custom_model_data: 2
        lore:
        - <reset><dark_purple>Respawns pets!
    recipes:
        1:
            type: shaped
            recipe id: HC_Recipe_FiaryGem
            input:
            - diamond|amethyst_block|diamond
            - amethyst_block|totem_of_undying|amethyst_block
            - diamond|amethyst_block|diamond

FairyGemScript:
    type: world
    debug: false
    events:
        on player right clicks wolf|cat|parrot|*horse|donkey with:HC_FairyGem:
            - ratelimit <player> 1t
            - if <context.entity.is_tamed> and <context.entity.owner> == <player> and !<context.entity.has_flag[respawnlocation]>:
                - flag <context.entity> respawnlocation:<player.bed_spawn>
                - flag <context.entity> gemlocation:<context.location>
                - take from:<context.player> slot:hand quantity:1
                - playsound <context.location> sound:BLOCK_AMETHYST_CLUSTER_BREAK volume:2 pitch:.1
        on wolf|cat|parrot|*horse|donkey dies:
            - if <context.entity.has_flag[respawnlocation]>:
                - determine passively cancelled
                - heal <context.entity>
                - adjust <context.entity> sitting:true
                - teleport <context.entity> <context.entity.flag[respawnlocation].if_null[<context.entity.flag[gemlocation]>]>
                - narrate "<reset><&color[#5f9ea0]>Your pet has respawned!" targets:<context.entity.owner>