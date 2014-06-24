gulp = require 'gulp'

# Load plugins
$ = require('gulp-load-plugins')()

gulp.task 'static', ->
  gulp.src('src/static/**')
    .pipe(gulp.dest('dist'))

gulp.task 'fonts', ->
  $.bowerFiles()
    .pipe($.filter('**/*.{eot,svg,ttf,woff}'))
    .pipe($.flatten())
    .pipe(gulp.dest('dist/out/bootstrap/src/fonts'))
    .pipe($.size())

gulp.task 'clean', ->
  gulp.src(['.tmp', 'dist'], { read: false }).pipe($.clean());

gulp.task 'build', ['static', 'fonts']

gulp.task 'default', ->
  gulp.start 'build'

gulp.task 'watch', ->
  gulp.watch('src/static/**').on 'change', ->
    gulp.start 'static'
