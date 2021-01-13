module Minitest
  # Mandatory Minitest initializer hook
  # Detected by Minitest.load_plugins, invoked during Minitest.init_plugins
  def self.plugin_hipster_init(options)
    if Hipster.enabled?
      reporter.reporters << Hipster::Reporter.new(options[:io], options)
    end
  end

  # Optional hook for command line params handling
  # Invoked by Minitest.process_args
  def self.plugin_hipster_options(opts, options)
    description = 'Generate an HTML test report with Minitest::Hipster'
    opts.on '-H', '--html', description do
      Hipster.enable!
    end
  end

  module Hipster
    VERSION = '0.1.0'

    @@enabled = false

    def self.enabled?
      @@enabled
    end

    def self.enable!
      @@enabled = true
    end
  end
end
