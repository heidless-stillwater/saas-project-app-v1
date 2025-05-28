
# Rails.configuration.to_prepare do
#   ActiveStorage::Blob.class_eval do
#     before_create :generate_key_with_prefix

#     def generate_key_with_prefix
#       self.key = if prefix
#         File.join prefix, self.class.generate_unique_secure_token
#       else
#         self.class.generate_unique_secure_token
#       end
#       puts "#############################################"
#       puts "self.key :: #{self.key}"
#       puts "#############################################"
#     end

#     def prefix
#       if Rails.env.production?
#         return nil
#       else
#         storage_env = "-DEV"        
#       end

#       puts "#####################################"
#       puts " TEST LOG"
#       puts "#{Rails.application.credentials.dig(:gcs_storage, :gcs_storage_prefix)}#{storage_env}"
#       puts "#####################################"

#       "#{Rails.application.credentials.dig(:gcs_storage, :gcs_storage_prefix)}#{storage_env}"
#     end
#   end
# end