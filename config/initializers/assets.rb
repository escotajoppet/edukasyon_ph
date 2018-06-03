# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
precompiled_assets = {
	'edukasyon_ph' => [],
	'class_schedules' => ['index', 'new', 'create', 'edit', 'update', 'show'],
	'subjects' => ['index', 'new', 'create', 'edit', 'update', 'show'],
	'students' => ['index', 'new', 'create', 'edit', 'update', 'show', 'enroll', 'tag'],
	'professors' => ['index', 'new', 'create', 'edit', 'update', 'show'],
	'reviews' => ['index', 'new', 'create', 'edit', 'update', 'show']
}

precompiled_assets.each do |controller, actions|
	Rails.application.config.assets.precompile += ["#{controller}.css", "#{controller}.js"]

	`touch #{Rails.root.join('app', 'assets', 'javascripts', "#{controller}.js")} || exit`
	`touch #{Rails.root.join('app', 'assets', 'stylesheets', "#{controller}.css")} || exit`

	actions.each do |action|
		`mkdir -p #{Rails.root.join('app', 'assets', 'javascripts', "#{controller}")}`
		`touch #{Rails.root.join('app', 'assets', 'javascripts', "#{controller}", "#{action}.js")} || exit`

		`mkdir -p #{Rails.root.join('app', 'assets', 'stylesheets', "#{controller}")}`
		`touch #{Rails.root.join('app', 'assets', 'stylesheets', "#{controller}", "#{action}.css")} || exit`

		Rails.application.config.assets.precompile += ["#{controller}/#{action}.css", "#{controller}/#{action}.js"]
	end
end