# UuidService

A simple webservice which responds to GET requests and returns a UUID

## Usage

1. The included war file can be deployed straight to an appropriate Java server
2. The service should be configured to use the root '/' context path

## Building a war

  The war file can be built on a development or build system, it does not need to be built on the server.

 **Requirements**

 - JRuby (Originally used 1.7.19)
 - Bundler (Originally used 1.8.5)
 - Compatible JDK  (Originally used 1.7.0_75-b13)

> I recommend using [RVM](https://rvm.io/) for managing ruby installs. It makes the process of installing and maintaining separate Ruby environments incredibly easy.

**Building**
 `cd uuid_service
 bundle install
 warble war`



## Contributing

1. Fork it ( https://github.com/[my-github-username]/uuid_service/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

