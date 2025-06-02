namespace :organizations do
  desc "seed organizations"
  task seed_organizations: :environment do
    Organization.destroy_all
    Plan.destroy_all
    User.destroy_all

    logo = Rails.root.join("db", "images", "logo", "choam-logo.png")
    puts "Loading logo from: #{logo}"

    choam = Organization.create(name: "C.H.O.A.M", active_org: true, domain: "choam.com", subdomain: "spice")
    choam.logo.attach(io: File.open(Rails.root.join("db", "images", "avatar-set", "17.png")), filename: "17.png")

    lumin = Organization.create(name: "Lumin Inc", active_org: false, domain: "lumin.com", subdomain: "innies")
    lumin.logo.attach(io: File.open(Rails.root.join("db", "images", "avatar-set", "9.png")), filename: "9.png")

    mega = Organization.create(name: "Mega Corp", active_org: false, domain: "mega.com", subdomain: "mega")
    mega.logo.attach(io: File.open(Rails.root.join("db", "images", "avatar-set", "13.png")), filename: "13.png")

    # puts "LUMIN: #{lumin.name} : #{lumin.active_org}"
    # puts "CHOAM: #{choam.name} : #{choam.active_org}"

    plan1 = Plan.create(id: 1, name: "premium", amount: 0.1e3, symbol: "", organization_id: choam.id)
    plan2 = Plan.create(id: 2, name: "free", amount: 00, symbol: "", organization_id: choam.id)
    
    # puts "PLAN: #{plan1.name} : #{plan1.amount}"
    # puts "PLAN: #{plan2.name} : #{plan2.amount}"

    lumin.plan_id = plan1.id
    lumin.save

    mega.plan_id = plan1.id
    mega.save

    choam.plan_id = plan1.id
    choam.save

    user1 = User.create(email: "jsnow@choam.com", username: "js_choam", password: "password", organization_id: choam.id, plan_id: 1, is_admin: true)

    avatar_rand = rand(1..24)
    avatar_fname = "#{avatar_rand}.png"
    puts "avatar_rand: #{avatar_rand}"
    puts "avatar_fname: #{avatar_rand}.png"
    puts "avatar_path: #{Rails.root.join("db", "images", "avatar-set", "#{avatar_fname}")}"

    user1.avatar.attach(io: File.open(Rails.root.join("db", "images", "avatar-set", "#{avatar_fname}")), filename: user1.email)

    puts "user1: #{user1.email} #{user1.username}"

    project_rand = rand(1..48)
    project_fname = "#{project_rand}.png"
    project1 = Project.create(name: "Spice Mining", details: "Mining the spice from Arrakis", expected_completion_date: Date.today + 30, organization_id: choam.id)
    project1.image.attach(io: File.open(Rails.root.join("db", "images", "rpg-fantasy-avatars", "PNG", "without-bg", "#{project_fname}")), filename: project1.id.to_s + ".png")

    item_rand = rand(1..48)
    item_fname = "#{item_rand}.png"
    item1 = Item.create(name: "Spice Harvester", description: "A machine to harvest spice", project_id: project1.id)
    item1.item_img.attach(io: File.open(Rails.root.join("db", "images", "craftpix-net-482753-free-currency-loot-vector-icons", "PNG", "without_shadow", "#{item_fname}")), filename: item1.id.to_s + ".png")

    item_rand1 = rand(1..48)
    item_fname1 = "#{item_rand1}.png"
    item2 = Item.create(name: "Spice Refinery", description: "A facility to refine spice", project_id: project1.id)
    item2.item_img.attach(io: File.open(Rails.root.join("db", "images", "craftpix-net-482753-free-currency-loot-vector-icons", "PNG", "without_shadow", "#{item_fname1}")), filename: item2.id.to_s + ".png")
  end
end
