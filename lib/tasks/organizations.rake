namespace :organizations do
  desc "seed organizations"
  task seed_organizations: :environment do
    Organization.destroy_all
    Plan.destroy_all
    User.destroy_all

    lumin = Organization.create(name: "Lumin Inc", active_org: false, domain: "lumin.com", subdomain: "innies")
    mega = Organization.create(name: "Mega Corp", active_org: false, domain: "mega.com", subdomain: "mega")
    choam = Organization.create(name: "C.H.O.A.M", active_org: true, domain: "choam.com", subdomain: "spice")
    puts "LUMIN: #{lumin.name} : #{lumin.active_org}"
    puts "CHOAM: #{choam.name} : #{choam.active_org}"

    plan1 = Plan.create(name: "premium", amount: 0.1e3, symbol: "", organization_id: 1)
    plan2 = Plan.create(name: "free", amount: 00, symbol: "", organization_id: 1)
    puts "PLAN: #{plan1.name} : #{plan1.amount}"
    puts "PLAN: #{plan2.name} : #{plan2.amount}"

    lumin.plan_id = plan2.id
    lumin.save

    mega.plan_id = plan2.id
    mega.save

    choam.plan_id = plan2.id
    choam.save

    user1 = User.create(email: "jsnow@choam.com", username: "jsnow", password: "password", organization_id: choam.id, plan_id: 2)
    user1 = User.create(email: "test_1@choam.com", username: "t1_choam", password: "password", organization_id: choam.id, plan_id: 2)
    user2 = User.create(email: "test_1@lumin.com", username: "t1_lumin", password: "password", organization_id: lumin.id, plan_id: 2)
    user3 = User.create(email: "test_1@mega.com", username: "t1_mega", password: "password", organization_id: mega.id, plan_id: 2)
    puts "user1: #{user1.email} #{user1.username}"
    puts "user2: #{user2.email} #{user1.username}"
  end
end
