require "docker_compose_ruby/version"
require 'json'
require 'yaml'
require 'pry-nav'

module DockerCompose
  class << self
    attr_accessor :project_name, :yaml_path, :yaml


    # Set Path to Docker Compose Yaml File.
    #
    # @param path [String]
    # @return [String]
    #
    # @example
    #   DockerCompose.set_yaml_path('/Users/test/projects/docker-compose.yml')
    def set_yaml_path(path)
      @yaml_path = "-f #{path}"
      @yaml = YAML.load_file(path)
    end

    # Set Specific compose project name.
    #
    # @param name [String]
    # @return [String]
    #
    # @example
    #   DockerCompose.set_project_name('test_project')
    def set_project_name(name)
      @project_name = "-p #{name}"
      name
    end

    # Ups the set of containers listed in your compose file.
    #
    # @param options [Hash]
    # @return [String]
    #
    # @example
    #   DockerCompose.up
    def up(options = {})
      options = nil if options.empty?
      compose('up',options)
    end

    # Deletes the set of containers listed in your compose file.
    #
    # @param options [Hash]
    # @return [String]
    #
    # @example
    #   DockerCompose.delete
    def delete(options = {})
      options = nil if options.empty?
      compose('delete',options)
    end

    # Stops the set of containers listed in your compose file.
    #
    # @param options [Hash]
    # @return [String]
    #
    # @example
    #   DockerCompose.stop
    def stop(options = {})
      options = nil if options.empty?
      compose('stop', options)
    end

    # Starts the set of containers listed in your compose file.
    #
    # @param options [Hash]
    # @return [String]
    #
    # @example
    #   DockerCompose.up
    def start(options = {})
      options = nil if options.empty?
      compose('start', options)
    end

    # Displays the current version of Docker compose
    #
    # @param options [Hash]
    # @return [String]
    #
    # @example
    #   DockerCompose.version
    def version
      compose('-v')
    end

    private
    def compose(command, options)
      case command
      when 'up'
        `docker-compose #{options} #{@yaml_path} #{@project_name} #{command} -d`
      when 'delete'
        `docker-compose #{options} #{@yaml_path} #{@project_name} kill`
        `docker-compose #{options} #{@yaml_path} #{@project_name} rm -f`
      when 'stop', 'start', 'version'
        `docker-compose #{options} #{@yaml_path} #{@project_name} #{command}`
      end
    end
  end
end
