module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('_public/package.json'),
    nodewebkit: {
      options: {
        version: "0.12.2",
        buildDir: './dist',
        platforms: ['osx', 'win', 'linux'],
        // winIco: '_public/icons/icon.ico',
        macIcns: '_public/icons/icon.icns'
      },
      src: './_public/**/*'
    },
  });

  grunt.loadNpmTasks('grunt-node-webkit-builder');

  grunt.registerTask('default', ['nodewebkit']);
};
