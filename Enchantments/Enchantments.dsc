HC_enchantment_autosmelt:
    type: enchantment
    id: autosmelt
    debug: false
    slots:
       - mainhand
    rarity: rare
    full_name: Melting Point
    category: DIGGER
    min_level: 1
    max_level: 1
    min_cost: 9999
    max_cost: 9999
    is_tradable: false
    is_discoverable: false

HC_autosmelt_enchantment_script:
    type: world
    debug: false
    events:
      on *_ore drops raw_* from breaking:
         - if <player.exists> and <player.item_in_hand.enchantment_types.contains_text[autosmelt]>:
            - determine passively cancelled
            - playeffect effect:smoke at:<context.location> quantity:4
            - drop <context.drop_entities.get[1].item.material.name.replace_text[raw_]>_ingot <context.location> quantity:<context.drop_entities.get[1].item.quantity> speed:0.1,0
         - else:
            - stop

HC_enchantment_shackling:
    type: enchantment
    id: shackling
    debug: false
    slots:
      - mainhand
    rarity: rare
    full_name: Shackling
    category: WEAPON
    min_level: 1
    max_level: 1
    min_cost: 9999
    max_cost: 9999
    is_tradable: false
    is_discoverable: false

HC_enchantment_shackling_script:
    type: world
    debug: false
    events:
       on player damages entity:
          - if <util.random_chance[15]> and <player.item_in_hand.enchantment_types.contains_text[shackling]>:
             - cast slowness amplifier:1 duration:3 <context.entity> hide_particles
             - playsound <context.damager> sound:block_chain_place volume:1 pitch:.75
HC_enchantment_bellowing:
    type: enchantment
    id: bellowing
    debug: false
    slots:
      - mainhand
    rarity: rare
    full_name: Bellowing
    category: WEAPON
    min_level: 1
    max_level: 1
    min_cost: 9999
    max_cost: 9999
    is_tradable: false
    is_discoverable: false

HC_enchantment_bellowing_script:
    type: world
    debug: false
    events:
       on player damages entity:
          - if <util.random_chance[10]> and <player.item_in_hand.enchantment_types.contains_text[bellowing]>:
             - cast levitation amplifier:2 duration:4 <context.entity> hide_particles
             - playsound <context.damager> sound:block.beacon.ambient volume:1 pitch:2

HC_enchantment_venom:
    type: enchantment
    id: venom
    debug: false
    slots:
      - mainhand
    rarity: rare
    full_name: Venom
    category: WEAPON
    min_level: 1
    max_level: 1
    min_cost: 9999
    max_cost: 9999
    is_tradable: false
    is_discoverable: false

HC_enchantment_venom_script:
    type: world
    debug: false
    events:
       on player damages entity:
          - if <util.random_chance[20]> and <player.item_in_hand.enchantment_types.contains_text[venom]>:
             - cast poison amplifier:2 duration:3 <context.entity> hide_particles
             - playsound <context.damager> sound:entity.drowned.hurt_water volume:1 pitch:2

HC_enchantment_draining:
   type: enchantment
   id: draining
   debug: false
   slots:
      - mainhand
   rarity: rare
   full_name: Draining
   category: WEAPON
   min_level: 1
   max_level: 1
   min_cost: 30
   max_cost: 30
   is_tradable: false
   is_discoverable: false

HC_enchantment_draining_script:
   type: world
   debug: false
   events:
      on player damages entity:
      - if <context.entity!=[armor_stand]> and <player.item_in_hand.enchantment_types.contains_text[draining]>:
         - heal <player> <context.final_damage.mul[.1]>