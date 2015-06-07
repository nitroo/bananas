require "bananas/version"

module Bananas
  GEMS = `gem list`
  private_constant :GEMS

  module_function def monkey_patches(mod = Object)
    mod.constants.map {|c| mod.const_get(c) }.push(mod)
        .keep_if {|c| c.respond_to?(:instance_methods) }
        .map {|c| Hash[object: c, methods: c.instance_methods(false)
        .map {|m| Hash[name: m, location: (Array(c.instance_method(m).source_location).first || next)] }.compact] }
        .map {|h| h[:methods].keep_if {|m| m[:location].match(ENV["GEM_HOME"]) }; h }
        .map {|h| h[:methods].reject! {|m| GEMS.match(/#{h[:object].instance_method(m[:name]).owner.to_s.split("::").first}/i)}; h }
        .reject {|h| h[:methods].empty? }
        .tap {|c| puts "Couldn't find any monkey patches for module '#{mod}'" if c.empty?}
        .each {|c| puts "%{object}:" % c; c[:methods].each {|m| puts "\t%-20{name} %{location}" % m }; putc "\n" }
  end
end