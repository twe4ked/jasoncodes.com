require 'active_support'
require 'active_support/core_ext/module/aliasing'

raise 'Albino not loaded' unless defined?(Albino)
class Albino
  
  def colorize_with_wrapped_lines(options = {})
    
    # disable the built in <div/> and <pre/> wrappers
    options[:O] = "#{@options[:O]},nowrap=true"
    
    # call the colorizer
    html = colorize_without_wrapped_lines(options)
    
    # wrap each line in <code/> so we can style them easier
    html.gsub!(/^.*$/, '<code>\0</code>')
    
    # wrap the result in a <pre/> with our desired CSS classes
    "<pre class=\"source source-#{@options[:l]}\">#{html}</pre>"
    
  end
  alias_method_chain :colorize, :wrapped_lines
  alias_method :to_s, :colorize
  
end