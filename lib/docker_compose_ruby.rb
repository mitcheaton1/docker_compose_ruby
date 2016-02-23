require "docker_compose_ruby/version"
require 'json'
require 'yaml'
require 'pry-nav'

module DockerCompose
  class << self
    attr_accessor :project_name, :yaml_path

    def set_yaml_path(path)
      @yaml_path = "-f #{path}"
    end

    def set_project_name(name)
      @project_name = "-p #{name}"
    end

    def up
      compose('up')
    end

    def build
      compose('build')
    end

    def kill(contianer)
      compose('kill',container)
    end

    def compose(command, options = {})
      `docker-compose #{@yaml_path} #{@project_name} #{command}`
    end

    def version
      compose('-v')
    end
  end
end
