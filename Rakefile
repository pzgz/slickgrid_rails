require "bundler/gem_tasks"

BASE_PATH =  File.dirname(__FILE__)
SRC_PATH = BASE_PATH + "/src/SlickGrid/"
OUTPUT_PATHS = {
  image: BASE_PATH + "/vendor/assets/images/slickgrid/",
  javascript:  BASE_PATH + "/vendor/assets/javascripts/slickgrid/",
  css: BASE_PATH + "/vendor/assets/stylesheets/slickgrid/"
}

JAVASCRIPT_FILES = {
  'core' => %w(
    slick.core.js
    slick.grid.js
    slick.editors.js
    slick.formatters.js
    slick.groupitemmetadataprovider.js
  ),
  'controls' => %w(
    controls/slick.columnpicker.js
    controls/slick.pager.js
  ),
  'plugins' => %w(
    plugins/slick.autotooltips.js
    plugins/slick.cellcopymanager.js
    plugins/slick.cellrangedecorator.js
    plugins/slick.cellrangeselector.js
    plugins/slick.cellselectionmodel.js
    plugins/slick.checkboxselectcolumn.js
    plugins/slick.headerbuttons.js
    plugins/slick.headermenu.js
    plugins/slick.rowmovemanager.js
    plugins/slick.rowselectionmodel.js
  )
}

STYLESHEET_FILES = {
  'core' => %w(
    slick.grid.css
    examples/slick-default-theme.css
  ),
  'controls' => %w(
    controls/slick.columnpicker.css
    controls/slick.pager.css
  ),
  'plugins' => %w(
    plugins/slick.headerbuttons.css
    plugins/slick.headermenu.css
  )
}

desc "Clean up the assets"
task :clean do
  Rake.rake_output_message 'Clean up assets......'
  FileUtils.rm_rf 'vendor'
end

desc "Generate the JavaScript assets"
task :javascripts do
  Rake.rake_output_message 'Generating javascripts......'
  all = ""
  JAVASCRIPT_FILES.each do |group, files|
    group_src = ""
    files.each do |f|
      src = File.join SRC_PATH, f
      fname = File.basename(src)
      dest = File.join OUTPUT_PATHS[:javascript], group, fname
      FileUtils.mkdir_p(File.dirname(dest))
      FileUtils.copy_entry src, dest, false, false, true
      group_src << "//= require slickgrid/#{group}/#{fname}\n"
    end
    File.open("#{OUTPUT_PATHS[:javascript]}#{group}.js", "w") do |out|
      out.write(group_src)
    end
    all << "//= require slickgrid/#{group}.js\n"
  end
  File.open("#{OUTPUT_PATHS[:javascript]}index.js", "w") do |out|
    out.write(all)
  end
end

desc "Generate the Image assets"
task :images do
  Rake.rake_output_message 'Generating images......'
  FileUtils.mkdir_p OUTPUT_PATHS[:image]
  FileUtils.cp_r "#{SRC_PATH}images/.", OUTPUT_PATHS[:image]
end

desc "Generate the StyleSheet assets"
task :stylesheets do
  Rake.rake_output_message 'Generating stylesheets......'
  all = "/*\n"
  STYLESHEET_FILES.each do |group, files|
    group_src = "/*\n"
    files.each do |f|
      src = File.join SRC_PATH, f
      fname = File.basename(src)
      dest = File.join OUTPUT_PATHS[:css], group, "#{fname}.erb"
      FileUtils.mkdir_p(File.dirname(dest))
      source_code = File.read src
      source_code.gsub!(/url\(\'\.\.\/images\/([-_.a-zA-Z0-9]+)\'\)/, 'url(<%= image_path("slickgrid/\1") %>)')
      source_code.gsub!(/url\(\'\.\.\/images\/([-_.a-zA-Z0-9]+)\'\)/, 'url(<%= image_path("slickgrid/\1") %>)')
      source_code.gsub!(/url\(\.\.\/images\/([-_.a-zA-Z0-9]+)\)/, 'url(<%= image_path("slickgrid/\1") %>)')
      File.open(dest, "w") do |out|
        out.write(source_code)
      end
      group_src << " *= require slickgrid/#{group}/#{fname}\n"
    end
    group_src << " */"
    File.open("#{OUTPUT_PATHS[:css]}#{group}.css", "w") do |out|
      out.write(group_src)
    end
    all << " *= require slickgrid/#{group}.css\n"
  end
  all << " */"
  File.open("#{OUTPUT_PATHS[:css]}index.css", "w") do |out|
    out.write(all)
  end
end

task :assets => [:clean, :javascripts, :images, :stylesheets]

task :build => :assets

task :default => :assets