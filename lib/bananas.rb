require "bananas/version"

module Bananas
  GEMS = Gem::Specification.to_a.map(&:name).join
  private_constant :GEMS

  def self.monkey_patches(mod = Object)
    mod.constants.map {|c| mod.const_get(c) }
        .tap {|c| c.push(mod) unless c.include?(mod) }
        .keep_if {|c| c.respond_to?(:instance_methods) }
        .map {|c| Hash[object: c, methods: c.instance_methods(false)
        .map {|m| Hash[name: m, location: (Array(c.instance_method(m).source_location).first || next)] }.compact] }
        .map {|h| h[:methods].keep_if {|m| m[:location].include? ENV["GEM_HOME"] }; h }
        .map {|h| h[:methods].reject! {|m| GEMS.include? h[:object].instance_method(m[:name]).owner.to_s.downcase.split("::").first}; h }
        .reject {|h| h[:methods].empty? }
        .tap {|c| puts "Couldn't find any monkey patches for module '#{mod}'" if c.empty?}
        .each {|c| puts "%{object}:" % c; c[:methods].each {|m| puts "\t%-20{name} %{location}" % m }; putc "\n" }
  end
end