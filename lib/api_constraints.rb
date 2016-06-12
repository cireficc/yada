class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @version_string = "application/vnd.yada.v#{@version}"
    @default || req.headers["Accept"].include?(@version_string)
  end
end
