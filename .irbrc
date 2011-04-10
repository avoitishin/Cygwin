# ~/.irbrc
# Requires the following gems:  wirble, hirb
#
# Hirb: http://tagaholic.me/hirb/doc/index.html
# Wirble: http://pablotron.org/software/wirble/

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 100
#IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history" 
#IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] ||= []
IRB.conf[:LOAD_MODULES] |= ['irb/completion']

IRB.conf[:PROMPT][:CUSTOM] = {
    :PROMPT_N => ">> ",
    :PROMPT_I => "> ",
    :PROMPT_S => "* ",
    :PROMPT_C => "-> ",
    :RETURN => "return: %s\n"
}
# Set default prompt
IRB.conf[:PROMPT_MODE] = :CUSTOM

# Just for Rails...
if rails_env = ENV['RAILS_ENV']
  rails_root = File.basename(Dir.pwd)
  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS] = {
	:PROMPT_I => "#{rails_root}> ",
	:PROMPT_S => "#{rails_root}* ",
	:PROMPT_C => "#{rails_root}? ",
	:RETURN   => "=> %s\n" 
  }
  IRB.conf[:PROMPT_MODE] = :RAILS

  # Called after the irb session is initialized and Rails has
  # been loaded (props: Mike Clark).
  IRB.conf[:IRB_RC] = Proc.new do
	ActiveRecord::Base.logger = Logger.new(STDOUT)
	ActiveRecord::Base.instance_eval { alias :[] :find }
  end
end

begin
	# load wirble
	require 'rubygems'
	require 'wirble'

	# start wirble (with color)
	wirble_opts = {
		:skip_prompt => true,
	}
	Wirble.init wirble_opts 
	Wirble.colorize

	colors = Wirble::Colorize.colors.merge({
		:keyword => :light_green,
		:symbol => :light_purple,
		:symbol_prefix => :light_purple,
		:open_hash => :white,
		:close_hash => :white,
		:open_array => :light_red,
		:close_array => :light_red,
		:comma => :white,
		:refers => :white,
		:string => :light_cyan,
		:open_string => :yellow,
		:close_string => :yellow,
		:number => :yellow,
		:object_addr_prefix => :light_blue,
		:object_line_prefix => :light_blue
	})
	Wirble::Colorize.colors = colors

rescue LoadError => err
	warn "Couldn't load Wirble: #{err}"
end

begin
	# load Hirb
	require 'hirb'
	Hirb.enable
rescue LoadError => err
	warn "Couldn't load Hirb: #{err}"
end
