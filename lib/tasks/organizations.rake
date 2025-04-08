namespace :organizations do
  desc "seed organizations"
  task seed_organizations: :environment do
    Organization.destroy_all

    lumin = Organization.create(name: "Lumin Inc", active_org: false, domain: "lumin.com", subdomain: "innies")
    mega = Organization.create(name: "Mega Corp", active_org: false, domain: "mega.com", subdomain: "mega")
    choam = Organization.create(name: "C.H.O.A.M", active_org: true, domain: "choam.com", subdomain: "spice")
    puts "LUMIN: #{lumin.name} : #{lumin.active_org}"
    puts "CHOAM: #{choam.name} : #{choam.active_org}"

    user1 = User.create(email: "jsnow@choam.com", username: "jsnow", password: "password", organization_id: choam.id)
    user1 = User.create(email: "test_1@choam.com", username: "t1_choam", password: "password", organization_id: choam.id)
    user2 = User.create(email: "test_1@lumin.com", username: "t1_lumin", password: "password", organization_id: lumin.id)
    user3 = User.create(email: "test_1@mega.com", username: "t1_mega", password: "password", organization_id: mega.id)
    puts "user1: #{user1.email} #{user1.username}"
    puts "user2: #{user2.email} #{user1.username}"
  end
end
