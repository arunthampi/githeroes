class Settings
  def self.github_config
    github_settings_file = File.read(Rails.root.join('config', 'github.yml'))
    YAML.load(github_settings_file)[Rails.env]
  end
end