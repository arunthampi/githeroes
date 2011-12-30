Factory.define(:hero) do |h|
  h.sequence(:login)            { |n| "login-#{n}" }
  h.sequence(:avatar_url)       { |n| "https://github.com/images/error/login-#{n}.gif" }
  h.sequence(:gravatar_id)      { |n| "gravatar-login-#{n}" }
  h.sequence(:name)             { |n| "Name #{n}" }
  h.sequence(:company)          { |n| "Company #{n}" }
  h.sequence(:blog)             { |n| "https://github.com/blog-#{n}" }
  h.sequence(:location)         { |n| "Location #{n}" }
  h.sequence(:email)            { |n| "login-#{n}@github.com" }
  h.hireable                    false
  h.sequence(:bio)              { |n| "Bio #{n}" }
  h.sequence(:public_repos)     { |n| n }
  h.sequence(:public_gists)     { |n| n }
  h.sequence(:followers)        { |n| n }
  h.sequence(:following)        { |n| n }
  h.sequence(:html_url)         { |n| "https://github.com/login-#{n}" }
  h.sequence(:joined_github_at) { |n| Time.now - (n * 24 * 60 * 60 * 100) }
end