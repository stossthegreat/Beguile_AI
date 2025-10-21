# Safer podhelper.rb – avoids double Flutter path bug during CI

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Generated.xcconfig'), __FILE__)

  # Try both possible paths
  unless File.exist?(generated_xcode_build_settings_path)
    alt_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
    generated_xcode_build_settings_path = alt_path if File.exist?(alt_path)
  end

  unless File.exist?(generated_xcode_build_settings_path)
    puts "[podhelper] ⚠️ Generated.xcconfig not found at #{generated_xcode_build_settings_path}"
    puts "[podhelper] Trying to regenerate..."
    system("flutter pub get")
  end

  raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first." unless File.exist?(generated_xcode_build_settings_path)

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end

  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try running flutter pub get again."
end

require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)
