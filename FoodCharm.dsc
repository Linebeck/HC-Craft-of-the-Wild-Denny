HC_FoodCharm:
    type: item
    debug: false
    data:
        discover: false
    material: gold_nugget
    display name: <reset><gold>Food Charm
    mechanisms:
        custom_model_data: 2
        lore:
        - <reset><green>The blessing of the chance to not lose food after eating!

FoodCharmScript:
    type: world
    debug: false
    events:
        on player consumes item:
            - narrate <context.item>