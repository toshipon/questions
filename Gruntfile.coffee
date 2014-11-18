"use strict"
mountFolder = (connect, dir) ->
  connect.static require("path").resolve(dir)

webpackDistConfig = require("./webpack.dist.config.js")
webpackDevConfig = require("./webpack.config.js")
module.exports = (grunt) ->

  # Let *load-grunt-tasks* require everything
  require("load-grunt-tasks") grunt

  # Read configuration from package.json
  pkgConfig = grunt.file.readJSON("package.json")
  grunt.initConfig
    pkg: pkgConfig.public
    webpack:
      dev: webpackDevConfig
      dist: webpackDistConfig

      start:
        keepAlive: true

    watch:
      dev:
        files: ["<%= pkg.src %>"]
        tasks: ["webpack:dev"]
        options:
          spawn: false

    open:
      options:
        delay: 500
      dev:
        path: "http://localhost:3000/"

    karma:
      unit:
        configFile: "karma.conf.js"

    copy:
      dist:
        files: [
          {
            # includes files within path
            flatten: true
            expand: true
            src: ["<%= pkg.src %>/*"]
            dest: "<%= pkg.dist %>/"
            filter: "isFile"
          }
          {
            flatten: true
            expand: true
            src: ["<%= pkg.src %>/images/*"]
            dest: "<%= pkg.dist %>/images/"
          }
        ]

    clean:
      dist:
        files: [
          dot: true
          src: ["<%= pkg.dist %>"]
        ]

  grunt.registerTask "dev", [
      "webpack:dev"
      "open:dev"
      "watch:dev"
    ]

  grunt.registerTask "test", ["karma"]
  grunt.registerTask "build", [
    "clean"
    "copy"
    "webpack"
  ]
  grunt.registerTask "default", []
  return