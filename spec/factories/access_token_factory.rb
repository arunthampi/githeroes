Factory.define(:access_token) do |a|
  a.sequence(:provider)  { |n| "fake-provider-#{n}" }
  a.sequence(:token)     { |n| "fake-token-#{n}"    }
  a.sequence(:secret)    { |n| "fake-secret-#{n}"   }
  a.sequence(:uid)       { |n| "fake-external-uid-#{n}"  }
  a.association(:hero)   { Factory(:hero) }
end