module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Builds custom modernizr script.
    modernizr: {
      build: {
        'devFile' : 'bower_components/modernizr/modernizr.js',
        'outputFile' : 'javascripts/modernizr.js',

        'tests': [
          'flexbox',
          'svg'
        ],

        'uglify' : false
      }
    },

    copy: {
      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'javascripts/src',
            src: '*.js',
            dest: 'javascripts/'
          }
        ]
      }
    },

    // Concatenates the javascript source files into the one file in "javascripts" folder.
    concat: {
      build: {
        src: [
          'bower_components/jquery/dist/jquery.js',
          'bower_components/overthrow/src/overthrow-polyfill.js',
          'javascripts/src/concat/*.js',
          '!javascripts/src/concat/main.js',
          'javascripts/src/concat/main.js'
        ],
        dest: 'javascripts/application.js'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'stylesheets/scss',
          src: '*.scss',
          dest: 'stylesheets',
          ext: '.css'
        }]
      }
    },

    exec: {
      kitmanifest: {
        cmd: function(file) {
          return 'kit manifest';
        }
      },
      kit: {
        cmd: function(file) {
          if (grunt.option('site')) {
            return 'kit push -s ' + grunt.option('site') + ' ' + file;
          } else {
            return 'kit push ' + file;
          }
        }
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build: {
        files: [{
          expand: true,
          cwd: 'images/src/',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      }
    },

    // Minifies the scalable vector graphics files
    svgmin: {
      build: {
        files: [{
          expand: true,
          cwd: 'assets/src/',
          src: '*.svg',
          dest: 'assets/',
          ext: '.svg'
        }]
      },
    },

    // Runs scss-lint for all SCSS files
    scsslint: {
      all: {
        src: 'stylesheets/scss/*.scss'
      },
      options: {
        force: true,
        bundleExec: false,
        config: '~/.scss-lint.yml',
        reporterOutput: null,
        colorizeOutput: true
      },
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      js: {
        files: 'javascripts/src/concat/*.js',
        tasks: ['concat:build', 'uglify:build', 'exec:kit:javascripts/*.js']
      },

      css: {
        files: 'stylesheets/scss/*.scss',
        tasks: ['sass:build', 'cssmin:build', 'exec:kit:stylesheets/*.css']
      },

      voog: {
        files: ['layouts/*.tpl', 'components/*.tpl'],
        options: {
          spawn: false
        }
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-scss-lint');

  grunt.registerTask('default', ['modernizr', 'concat', 'uglify', 'sass', 'cssmin', 'imagemin', 'svgmin']);

  grunt.event.on('watch', function(action, filepath, target) {
    if (target == 'voog') {
      if (action == "added" || action == "deleted") {
        grunt.task.run(['exec:kitmanifest']);
      }
      if (action != "deleted") {
        grunt.task.run(['exec:kit:' + filepath]);
      }
    }
  });
};
