require "docker_compose_ruby/version"
require 'json'
require 'yaml'
require 'pry-nav'

module DockerCompose
  class << self
    attr_accessor :project_name, :yaml_path, :yaml

    def set_yaml_path(path)
      @yaml_path = "-f #{path}"
      @yaml = YAML.load_file(path)
    end

    def set_project_name(name)
      @project_name = "-p #{name}"
      name
    end

    def up(options = {})
      compose('up',options)
    end

    def build
      compose('build')
    end

    def kill(contianer)
      compose('kill',container)
    end

    def stop
      compose('stop')
    end

    def compose(command, options = {})
      case command
      when 'up'
        `docker-compose #{options} #{@yaml_path} #{@project_name} #{command}`
      when 'kill', 'stop', 'start'
        `docker-compose #{options} #{command}`
      end
    end

    def version
      compose('-v')
    end
  end
end
