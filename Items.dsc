#Debug
HC_cooking_pot_demo:
    type: item
    debug: false
    material: campfire
    data:
        discover: false
    display name: <reset>Cooking Pot <red>DEMO

#UI & Models
HC_menu_gray:
    type: item
    debug: false
    material: gray_stained_glass_pane
    data:
        discover: false
    display name: <reset>

HC_menu_cooking_pot_UI:
    type: item
    debug: false
    material: paper[custom_model_data=5]
    data:
        discover: false
    display name: <reset><gray>Cooking Pot

HC_menu_green:
    type: item
    debug: false
    material: lime_stained_glass_pane
    data:
        discover: false
    display name: <reset><green>Place Ingredients here

HC_menu_cooking_pot_confirm:
    type: item
    debug: false
    material: paper[custom_model_data=7]
    data:
        discover: false
    display name: <reset><bold><red>CONFIRM

HC_menu_cooking_pot_model:
    type: item
    debug: false
    material: paper[custom_model_data=8]
    data:
        discover: false
    display name: <reset><bold><red>NULL REPORT TO MOD

#Workstations
HC_cooking_pot:
    type: item
    debug: false
    material: paper
    mechanisms:
        custom_model_data: 6
    flags:
        UUID: <util.random_decimal>
    data:
        discover: true
    display name: <reset>Cooking Pot
    recipes:
        1:
            type: shaped
            input:
            - air|potion[potion_effects=[type=WATER;upgraded=false;extended=false]]|air
            - iron_ingot|cauldron|iron_ingot
            - iron_ingot|stick|iron_ingot
#Food
HC_slightly_baked_apple:
    type: item
    debug: false
    material: apple
    data:
        discover: false
    display name: <reset>Slightly Baked Appple

HC_Seared_Steak:
    type: item
    debug: false
    material: cooked_beef
    data:
        discover: false
    display name: <reset>Seared Steak

HC_Monster_Extract:
    type: item
    debug: false
    material: sugar
    data:
        discover: false
    mechanisms:
        custom_model_data: 2
    display name: <reset><&color[#702963]>Monster Extract
    lore:
        - <reset><&color[#738FA7]>This suspicious spice can be used<n><reset><&color[#738FA7]>to make a number of monstrous meals

HC_Rock_Salt:
    type: item
    debug: false
    material: sugar
    data:
        discover: false
    mechanisms:
        custom_model_data: 1
    display name: <reset><&color[#A27C7C]>Rock Salt
    lore:
        - <reset><gray>Crystallized salt from the ancient sea commonly used to season meals.<n><reset><gray>Cannot be eaten in this form.