require 'rubygems'
require 'chef'

TOPDIR = File.expand_path(File.dirname(__FILE__))

desc "Generate skeleton directory structure for a new cookbook."
task :create_cookbook, [:name] do |t,args|
  cookbook_dir = File.join(TOPDIR, "cookbooks", args.name)
  attributes_dir = File.join(cookbook_dir, "attributes")
  recipes_dir = File.join(cookbook_dir, "recipes")
  templates_dir = File.join(cookbook_dir, "templates")
  templates_default_dir = File.join(templates_dir, "default")
  files_dir = File.join(cookbook_dir, "files")
  files_default_dir = File.join(files_dir, "default")
  recipes_file = File.join(recipes_dir, "default.rb")
  attributes_file = File.join(attributes_dir, "#{args.name}.rb")
  definitions_dir = File.join(cookbook_dir, "definitions")

  FileUtils.mkdir_p(cookbook_dir)
  FileUtils.mkdir_p(attributes_dir)
  FileUtils.mkdir_p(recipes_dir)
  FileUtils.mkdir_p(templates_dir)
  FileUtils.mkdir_p(templates_default_dir)
  FileUtils.mkdir_p(files_dir)
  FileUtils.mkdir_p(files_default_dir)
  FileUtils.mkdir_p(definitions_dir)
  FileUtils.touch(recipes_file)
  FileUtils.touch(attributes_file)
end
