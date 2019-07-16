
Geocoder.configure(
    # Geocoding options
    timeout: 100000,                 # geocoding service timeout (secs)
    lookup: :google,

    :ip_lookup => :ipinfo_io, # name of geocoding service (symbol)


    use_https: true,           # use HTTPS for lookup requests? (if supported)
    # http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
    # https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
    google: {
        api_key: 'AIzaSyDjxuWTw31O4LY7yBGGsRkBE-OVC-TjTN4',
    },# API key for geocoding service
    # cache: nil,                 # cache object (must respond to #[], #[]=, and #keys)
    # cache_prefix: 'geocoder:',  # prefix (string) to use for all cache keys

    # Exceptions that should not be rescued by default
    # (if you want to implement custom error handling);
    # supports SocketError and Timeout::Error
    always_raise: :all,

    # Calculation options
    units: :mi,                 # :km for kilometers or :mi for miles
    # distances: :linear
    #         # :spherical or :linear
    logger: Rails.logger,
    kernel_logger_level: ::Logger::DEBUG
    )