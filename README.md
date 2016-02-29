# DockerComposeRuby

Simple Ruby wrapper for the docker compose cli

TODO: Delete this and the text above, and describe your gem

## Installation

You need to have the docker compose cli installed. 

Add this line to your application's Gemfile:

```ruby
gem 'docker_compose_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker_compose_ruby

## Usage

Set the path to your docker file. 

    $ DockerCompose.set_yaml_path('/path/to/docker-compose.yml')

Set the project name (if no name is set it will be tthe name of the compose file's directory). 

    $ DockerCompose.set_project_name('test_project')

Up the compose project containers. 

    $ DockerCompose.up

Delete the compose project containers. 

    $ DockerCompose.delete

Stop the compose project containers. 

    $ DockerCompose.stop

Start the compose project containers. 

    $ DockerCompose.start

## Development

I wanted something to use in a project I'm building, and there really wasn't anything out there that gives me the simplicity of the cli, but without having to repeat myself. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docker_compose_ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

