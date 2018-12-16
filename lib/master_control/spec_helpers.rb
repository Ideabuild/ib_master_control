# frozen_string_literal: true

# include all of the files inside the `lib/master_control/spec_helpers` folder
Gem.find_files('master_control/spec_helpers/**/*.rb').each { |path| require path }
