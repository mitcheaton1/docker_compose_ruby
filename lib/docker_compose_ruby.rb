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
      options = nil if options.empty?
      compose('up',options)
    end

    def delete(options = {})
      options = nil if options.empty?
      compose('delete',options)
    end

    def stop(options = {})
      options = nil if options.empty?
      compose('stop', options)
    end

    def start(options = {})
      options = nil if options.empty?
      compose('start', options)
    end

    def compose(command, options)
      case command
      when 'up'
        `docker-compose #{options} #{@yaml_path} #{@project_name} #{command} -d`
      when 'delete'
        `docker-compose #{options} #{@yaml_path} #{@project_name} kill`
        `docker-compose #{options} #{@yaml_path} #{@project_name} rm -f`
      when 'stop', 'start'
        `docker-compose #{options} #{@yaml_path} #{@project_name} #{command}`
      end
    end

    def version
      compose('-v')
    end
  end
end
