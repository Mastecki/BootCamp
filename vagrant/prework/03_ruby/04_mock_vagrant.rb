#!/usr/bin/env ruby

# w gigantycznym uproszczeniu tak wyglada kod vagranta,
# ktory jest odpalany w domyslym Vagrantfile
# stworzonym przez `vagrant init`
class Vagrant
	class Config
		class VM
			def initialize()
				@box = "default_box"
			end
			attr_accessor :box
		end
		def initialize(schema_version)
			puts "Vagrant.Config::initialize(schema_version=#{schema_version})"
			@vm = VM.new()
		end
		attr_accessor :vm
	end

	def self.configure(schema_version)
		puts "Vagrant.configure(#{schema_version})"
		config = Config.new(schema_version)
		yield config
	end
end

# wyglada znajomo?
Vagrant.configure("2") do |config|
	puts "domyslna wartosc config.vm.box to #{config.vm.box}"
	config.vm.box = "ubuntu"
	puts " a teraz wartosc config.vm.box to #{config.vm.box}"
end

# prawdziwy Vagrant.configure("2") zwraca Vagrant::Config::V2::Root, ale tak gleboko w szczegoly juz nie wchodzmy
# dla chetnych, kod Vagranta jest otwarty i mozna sobie poczytac:
#   https://github.com/hashicorp/vagrant/blob/5b501a3fb05ed0ab16cf10991b3df9d231edb5cf/lib/vagrant/config/v2/loader.rb#L146