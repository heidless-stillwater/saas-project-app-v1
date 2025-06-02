module ApplicationHelper
  def gravatar_for(user, options = { size: 200 })
    # Assume you manually set the email_address here or get it from user input
    email_address = user.email.downcase

    # Create the SHA256 hash
    hash = Digest::SHA256.hexdigest(email_address)

    # Set default URL and size parameterss
    size = options[:size]
    default = "https://www.gravatar.com/avatar/?d=identicon&s=#{size}"

    # Compile the full URL with URI encoding for the parameters
    params = URI.encode_www_form("d" => default, "s" => size)
    image_src = "https://www.gravatar.com/avatar/#{hash}?#{params}"

    image_tag(image_src, alt: user.email, class: "rounded shadow mx-auto d-block")
  end


  def organization_name(organization_id)
    # Fetch the organization name from the database
    organization = Organization.find_by(id: organization_id)
    if organization
      organization.name
    else
      "Unknown Organization"
    end
  end
end
